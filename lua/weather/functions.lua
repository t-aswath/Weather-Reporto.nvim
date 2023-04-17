
-- Define a function to fetch information from a URL
local function fetch(city,country)
  local url = "https://search.yahoo.com/search?p=weather+".. city .. "+" ..country
  -- Use the system function to make a curl request to the URL
  local handle = io.popen("curl -s " .. url)
  local response = handle:read("*a")
  handle:close()
  -- Check if the request was successful (non-empty response)
  if response and response ~= "" then
    -- Return the response body (HTML content)
    -- Define a regex pattern to match HTML tags and extract their content
    local pattern = "<span%s+class=\"currTemp\">(.-)</span>"
    local p2 = '<span%s+class=\"condition\">(.-)</span>'

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
    return parsed_data[1] .. parsed_data[2]

  else
    print("Failed to fetch data from " .. url)
    return ''
  end
end


-- Call the fetch function with the URL to fetch data
return fetch
