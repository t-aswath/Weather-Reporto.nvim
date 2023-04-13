-- Define a function to fetch information from a URL

local defaults = {
        city = "Amsterdam",
        country = "Netherlands"
}

local content = {}

function content.setup(opts)
        opts = opts | {}
        for k , v in pairs( defaults )
                if opts[k] == nil then
                          opts[k]=v
                end
        end
end
