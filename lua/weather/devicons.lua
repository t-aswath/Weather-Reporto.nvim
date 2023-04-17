local day = {
    Sunny = ' ',
    fog = ' ',
    haze = ' ',
    smoke = ' ',
    tornado = '',
    lightning = ' ',
    snow = ' ',
    Partly_Cloudy = ' ',
    Cloudy = ' ',
    rain_sprinkle = ' ',
    rain_rain_wind = ' ',
    rain_showers = ' ',
    rain_wind = ' ',
    rain_rain = ' ',
    rain_thunderstorm = ' ',
    hail = ' ',
    wind_light = ' ',
    wind_windy = ' '
}
local night = {
    clear = '',
    fog = '',
    haze = '', -- no haze, using fog
    smoke = '',
    tornado = '',
    lightning = '',
    snow = '',
    cloudy_partly = '',
    cloudy_cloudy = '',
    rain_sprinkle = '',
    rain_wind = '',
    rain_showers = '',
    rain_rain = '',
    rain_thunderstorm = '',
    hail = '',
    wind_light = '',
    wind_windy = '',
}

local cond = function (opt)
    local val=""
    local flag=1
    for i in string.gmatch(opt,"%S+") do
        if flag then
            val=val .. i
            flag=0
        else
            val=val .. "_" .. i
        end
    end
    print(val)
    return day[val]
end

return {
    cond = cond,
    day=day,
    night=night,
}
