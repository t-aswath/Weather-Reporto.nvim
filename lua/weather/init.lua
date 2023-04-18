-- Define a function to fetch information from a URLs
--
local fetchdata = require("weather.functions")
--local nerdicons = require("weather.devicons")
local math = require("math")

-- struct defaults
-- city : string
-- country : string
-- celsius : bool
-- displaycityname  : bool
--
--
-- struct contenot
-- condition : string
-- temp

local defaults = {
	city = "Amsterdam",
	country = "Netherlands",
	celsius = false,
}

local content = {}

function content.setup(opts)
	opts = opts or {}
	for k, v in pairs(defaults) do
		if opts[k] == nil then
			opts[k] = v
		end
	end

	content.feed = fetchdata(opts.city, opts.country)
	local arg = content.feed
	if arg.temp and arg.temp ~= "NaN" then
		arg.celtemp = tostring(math.floor((5 / 9) * (tonumber(arg.temp) - 32)))
		-- if celsius is true , it will concatenate celsius temp , else farenheit temp --
		content.strfeed = ((opts.celsius and arg.celtemp) or arg.temp) .. ((opts.celsius and "°C ") or "°F ") --.. nerdicons[tonumber(arg.condition)]--.. nerdicons.cond(arg.condition)
		content.kfeed = tostring(tonumber(arg.temp) + 241) .. "K " .. arg.condition --.. nerdicons.weathercode[tonumber(arg.condition)]
	else
		content.feed = {
			celtemp = "#E3",
			temp = "#E3",
		}
		content.kfeed = "#E3"
		content.strfeed = "#E3"
	end
end

return content
