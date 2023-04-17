-- Define a function to fetch information from a URLs
--
local fetchdata = require ("weather.functions")
--local nerdicons = require("weather.devicons")
local meth = require('math')

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
        for k , v in pairs( defaults ) do
                if opts[k] == nil then
                          opts[k]=v
                end
        end
        
        content.feed = fetchdata(opts.city,opts.country)
        local arg = content.feed
        if opts.celsius then
            arg.celtemp=tostring(math.floor((5/9)*(tonumber(arg.temp)-32)))
        end
        -- if celsius is true , it will concatenate celsius temp , else farenheit temp --
        content.strfeed = ((opts.celsius and arg.celtemp) or arg.temp)  .. ((opts.celsius and "°C ") or "°F ") --.. nerdicons.cond(arg.condition)
        content.kfeed = tostring(tonumber(arg.temp)+241) .. "K " --.. nerdicons.cond(arg.condition)


end

return content


