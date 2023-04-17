-- Define a function to fetch information from a URL

local M = require ("lua/functions")

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
        print(vim.inspect(M.data))
end
table.insert(content,M.fetch)


