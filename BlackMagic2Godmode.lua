local TABLE_TableIndirection = {};
TABLE_TableIndirection["obf_stringchar%0"] = string['char'];
TABLE_TableIndirection["obf_stringbyte%0"] = string['byte'];
TABLE_TableIndirection["obf_stringsub%0"] = string['sub'];
TABLE_TableIndirection["obf_bitlib%0"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%0"] = TABLE_TableIndirection["obf_bitlib%0"]['bxor'];
TABLE_TableIndirection["obf_tableconcat%0"] = table['concat'];
TABLE_TableIndirection["obf_tableinsert%0"] = table['insert'];
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	TABLE_TableIndirection["result%0"] = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		TABLE_TableIndirection["obf_tableinsert%0"](TABLE_TableIndirection["result%0"], TABLE_TableIndirection["obf_stringchar%0"](TABLE_TableIndirection["obf_XOR%0"](TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_STR, i, i + 1)), TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return TABLE_TableIndirection["obf_tableconcat%0"](TABLE_TableIndirection["result%0"]);
end
bit32 = {};
TABLE_TableIndirection["N%0"] = 32;
TABLE_TableIndirection["P%0"] = 2 ^ TABLE_TableIndirection["N%0"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["P%0"];
	return (TABLE_TableIndirection["P%0"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount > 0) then
		TABLE_TableIndirection["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["P%0"] / 2)) then
			TABLE_TableIndirection["add%0"] = TABLE_TableIndirection["P%0"] - (2 ^ (TABLE_TableIndirection["N%0"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
TABLE_TableIndirection["Instances%0"] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\226\192\201\32\227\181\224\11\216", "\126\177\163\187\69\134\219\167")]=Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\16\206\56\192\249\45\234\63\204", "\156\67\173\74\165")),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\165\72\27\185", "\38\84\215\41\118\220\70")]=Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\118\4\35\31\251", "\158\48\118\66\114")),[LUAOBFUSACTOR_DECRYPT_STR_0("\130\41\17\49\118\137\250\169\33\28", "\155\203\68\112\86\19\197")]=Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\111\208\55\251\69\84\228\250\67\209", "\152\38\189\86\156\32\24\133")),[LUAOBFUSACTOR_DECRYPT_STR_0("\207\88\178\72\248", "\38\156\55\199")]=Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\155\114\105\38\23", "\35\200\29\28\72\115\20\154"))};
TABLE_TableIndirection["Instances%0"]['ScreenGui']['Name'] = LUAOBFUSACTOR_DECRYPT_STR_0("\42\188\195\218\136\34\19\12\182", "\84\121\223\177\191\237\76");
TABLE_TableIndirection["Instances%0"]['ScreenGui']['Parent'] = game['Players']['LocalPlayer']:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\139\90\200\185\63\66\23\212\178", "\161\219\54\169\192\90\48\80"));
TABLE_TableIndirection["Instances%0"]['Frame']['Name'] = LUAOBFUSACTOR_DECRYPT_STR_0("\111\80\1\40\76", "\69\41\34\96");
TABLE_TableIndirection["Instances%0"]['Frame']['Parent'] = TABLE_TableIndirection["Instances%0"]['ScreenGui'];
TABLE_TableIndirection["Instances%0"]['Frame']['Size'] = UDim2.new(2 - 1, 1270 - (226 + 1044), 4 - 3, 0 - 0);
TABLE_TableIndirection["Instances%0"]['Frame']['BorderColor3'] = Color3.fromRGB(0 - 0, 0 - 0, 619 - (555 + 64));
TABLE_TableIndirection["Instances%0"]['Frame']['BorderSizePixel'] = 931 - (857 + 74);
TABLE_TableIndirection["Instances%0"]['Frame']['BackgroundColor3'] = Color3.fromRGB(1212 - (892 + 65), 823 - (367 + 201), 1182 - (214 + 713));
TABLE_TableIndirection["Instances%0"]['ImageLabel']['Name'] = LUAOBFUSACTOR_DECRYPT_STR_0("\149\206\214\13\7\7\189\193\210\6", "\75\220\163\183\106\98");
TABLE_TableIndirection["Instances%0"]['ImageLabel']['Parent'] = TABLE_TableIndirection["Instances%0"]['Frame'];
TABLE_TableIndirection["Instances%0"]['ImageLabel']['Size'] = UDim2.new(2 - 1, 0 - 0, 1 + 0, 0 + 0);
TABLE_TableIndirection["Instances%0"]['ImageLabel']['BorderColor3'] = Color3.fromRGB(877 - (282 + 595), 0, 1637 - (1523 + 114));
TABLE_TableIndirection["Instances%0"]['ImageLabel']['BorderSizePixel'] = 180 - (67 + 113);
TABLE_TableIndirection["Instances%0"]['ImageLabel']['BackgroundColor3'] = Color3.fromRGB(230 + 25, 363 - 108, 1320 - (68 + 997));
TABLE_TableIndirection["Instances%0"]['ImageLabel']['ScaleType'] = Enum['ScaleType']['Crop'];
TABLE_TableIndirection["Instances%0"]['ImageLabel']['Image'] = "rbxassetid://3567071004";
TABLE_TableIndirection["Instances%0"]['ImageLabel']['BackgroundTransparency'] = 0;
TABLE_TableIndirection["Instances%0"]['Sound']['Name'] = LUAOBFUSACTOR_DECRYPT_STR_0("\33\178\130\57\216", "\185\98\218\235\87");
TABLE_TableIndirection["Instances%0"]['Sound']['Parent'] = TABLE_TableIndirection["Instances%0"]['Frame'];
TABLE_TableIndirection["Instances%0"]['Sound']['SoundId'] = "rbxassetid://1840297174";
TABLE_TableIndirection["Instances%0"]['Sound']['Volume'] = 10;
TABLE_TableIndirection["Instances%0"]['Sound']['Looped'] = true;
TABLE_TableIndirection["Instances%0"]['Sound']:Play();
TABLE_TableIndirection["TextChatService%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\255\57\63\242\253\162\202\40\20\227\204\188\194\63\34", "\202\171\92\71\134\190"));
TABLE_TableIndirection["Channel%0"] = TABLE_TableIndirection["TextChatService%0"]['TextChannels']['RBXGeneral'];
task.spawn(function()
	while true do
		TABLE_TableIndirection["FlatIdent_7366E%0"] = 0 + 0;
		while true do
			if (0 == TABLE_TableIndirection["FlatIdent_7366E%0"]) then
				task.wait(1);
				TABLE_TableIndirection["Channel%0"]:SendAsync(LUAOBFUSACTOR_DECRYPT_STR_0("\0\129\32\135\63\196\108\156\33\196\108\171\33\200\34\141\58\196\108\175\38\215\41\154\39\204\41\134\61", "\232\73\161\76"));
				break;
			end
		end
	end
end);
