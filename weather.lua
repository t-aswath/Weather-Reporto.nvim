-- Define a function to fetch information from a URL
local function fetch(url)
	-- Use the nvim http library to make a GET request to the URL
	local response = vim.fn.httpget(url)

	-- Check if the response was successful (status code 200)
	if response.status ~= 200 then
		print("Failed to fetch data from " .. url)
		return nil
	end

	-- Return the response body
	return response.body
end

-- Define a command to insert scraped information into the current buffer
vim.cmd([[
command! -nargs=1 WebScrape lua require('web_scrape').insert_scraped_data(<f-args>)
]])

-- Define a Lua module for our plugin
local M = {}

-- Define the function that will be called by the command
function M.insert_scraped_data(args)
	-- Fetch the data from the specified URL
	local data = fetch(args)

	-- If data was fetched successfully, insert it into the current buffer
	if data then
		vim.api.nvim_put({ data }, "l", true, true)
		print("Inserted scraped data into buffer")
	end
end

-- Return the module table
return M
