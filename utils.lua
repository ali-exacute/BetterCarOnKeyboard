convertTable = {
	{
		gta   = '~s~',
		fivem = '^0',
		html  = 'white'
	},
	{
		gta   = '~r~',
		fivem = '^1',
		html  = 'red'
	},
	{
		gta   = '~g~',
		fivem = '^2',
		html  = 'green'
	},
	{
		gta   = '~y~',
		fivem = '^3',
		html  = 'yellow'
	},
	{
		gta   = '~b~',
		fivem = '^4',
		html  = 'blue'
	},
	{
		gta   = '~HUD_COLOUR_BLUELIGHT~',
		fivem = '^5',
		html  = 'lightblue'
	},
	{
		gta   = '~p~',
		fivem = '^6',
		html  = 'Purple'
	},
	{
		gta   = '~w~',
		fivem = '^7',
		html  = 'white'
	},
	{
		gta   = '~o~',
		fivem = '^8',
		html  = 'orange'
	},
	{
		gta   = '~c~',
		fivem = '^9',
		html  = 'Grey'
	},
	{
		gta   = '~u~',
		fivem = '^10',
		html  = 'black'
	}
	
}

--- Convert color from one type to another
---@param message string message to be converted
---@param patternFrom string pattern to be replaced with patternTo : gta | fivem
---@param patternTo string pattern to get replaced with patternFrom : gta | fivem | html
function ConvertColor(message, patternFrom, patternTo)
	-- this is one of the most scuffed scripts i wrote to this day -_-
	if message then
		local constMessage = message
		if patternFrom then
			if patternFrom ~= 'html' then
				toHtmlData = {}
				for i=1, #convertTable do
					local colorsMetaData = convertTable[i]
					if patternTo ~= 'html' then
						-- look for GTA pattern ~r~
						if string.find(message, colorsMetaData[patternFrom]) then
							message = string.gsub(message, colorsMetaData[patternFrom], colorsMetaData[patternTo] or '')
						end
						-- look for Fivem pattern with escape or it will not work	^1
						if string.find(message, '%'..colorsMetaData[patternFrom]) then
							message = string.gsub(message, '%'..colorsMetaData[patternFrom], colorsMetaData[patternTo] or '')
						end
					else
						-- look for GTA pattern ~r~
						if string.find(message, colorsMetaData[patternFrom]) then
							local first, last = message:find(colorsMetaData[patternFrom])
							toHtmlData[#toHtmlData+1] = {startAt = first, endAt = last, color = colorsMetaData[patternTo]}
						end
						-- look for Fivem pattern with escape or it will not work	^1
						--if string.find(message, '%'..colorsMetaData[patternFrom]) then
						--	message = string.gsub(message, '%'..colorsMetaData[patternFrom], colorsMetaData[patternTo] or '')
						--end
					end
				end

				if #toHtmlData > 0 then
					message = ''
					for i=1, #toHtmlData do
						local text = constMessage:sub(toHtmlData[i].endAt + 1, toHtmlData[i + 1] and (toHtmlData[i + 1].startAt -1) or constMessage:len())
						local finalText = "<span style='color:"..toHtmlData[i].color..";'>"..text.."</span>"
						message = message .. finalText
					end
				end
			end
		end
	end
	return message
end

function Draw2DText(content, x, y, font, colour, scale)
    font = font or 0
    colour = colour or {255, 255, 255}
    scale = scale or .6
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1], colour[2], colour[3], 255)
    BeginTextCommandDisplayText('STRING')
    SetTextOutline()
    AddTextComponentSubstringPlayerName(content)
    EndTextCommandDisplayText(x, y)
end