-- Define a function to fetch information from a URLs
--
local fetchdata = require ("weather.functions")


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
        country = "Netherlands"
}


local content = {}

function content.setup(opts)
        opts = opts or {}
        for k , v in pairs( defaults ) do
                if opts[k] == nil then
                          opts[k]=v
                end
        end
        content.data=fetchdata(opts.city,opts.country)
end

return content


