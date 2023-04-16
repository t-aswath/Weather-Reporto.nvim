local url = "https://weather.com/en-IN/weather/today/l/304a29c4508c568c8e13bf32c284cac0458f7966d589c282a048044f9eef7d43"

-- Define a function to fetch information from a URL
local function fetch(url)
	-- Use the system function to make a curl request to the URL
	local handle = io.popen("curl -s " .. url)
	local response = handle:read("*a")
	handle:close()

	-- Check if the request was successful (non-empty response)
	if response and response ~= "" then
		-- Return the response body (HTML content)
		-- Define a regex pattern to match HTML tags and extract their content
		local pattern = '<div%s+data%-testid="wxPhrase"%s+class="CurrentConditions%-%-phraseValue%-%-mZC_p">(.-)</div>'
		local p2 =
			'<span%s+data%-testid="TemperatureValue"%s+class="CurrentConditions%-%-tempValue%-%-MHmYY">(.-)</span>'

		-- Create a table to store the extracted data
		local parsed_data = {}

		-- Loop through the response and apply the regex pattern
		for match in response:gmatch(pattern) do
			-- Add the extracted content to the parsed_data table
			table.insert(parsed_data, match)
		end

		for match in response:gmatch(p2) do
			-- Add the extracted content to the parsed_data table
			table.insert(parsed_data, match)
		end

		return parsed_data
	else
		print("Failed to fetch data from " .. url)
		return nil
	end
end

-- Call the fetch function with the URL to fetch data
local data = fetch(url)
return data[2] .. data[1]
