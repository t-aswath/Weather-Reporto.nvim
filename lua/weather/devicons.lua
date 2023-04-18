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


local weathercode = {
    [0] = {'Tornado' , ''},
    [1] = {'Tropical Storm' , ' ' },
    [2] = {'Hurricane' , ''},
    [3] = {'Severe Thunderstorm'},
    [4] = {'Thunderstorm'},
    [5] = {'Rain+Snow','󰙿 '},
    [6] = {'Rain+Sleet'},
    [7] = {'Snow+Sleet'},
    [8] = {'Freezing Drizzle'},
    [9] = {'Drizzle'},
    [10] = {'Freezing Rain'},
    [11] = {'Showers'},
    [12] = {'Showers'},
    [13] = {'Snow Flurries'},
    [14] = {'Light Snow'},
    [15] = {'Blowing Snow'},
    [16] = {'Snow'},
    [17] = {'Hail'},
    [18] = {'Sleet'},
    [19] = {'Dust'},
    [20] = {'Foggy'},
    [21] = {'Haze'},
    [22] = {'Smoky',' '},
    [23]= {'Blustery',' '},
    [24] = {'Windy','󰖝 '},
    [25] = {'Cold',' '},
    [26] = {'Cloudy','󰖐 '},
    [27] = {'Mostly Cloudy' , ' '},
    [28] = {'Mostly Cloudy' , ' '},
    [29] = {'Partly Cloudy',''},
    [30] = {'Partly Cloudy',' '},
    [31] = {'Clear',''},
    [32] = {'Sunny',' '},
    [33] = {'Fair'},
    [34] = {'Fair'},
    [35] = {'Rain+Hail'},
    [36] = {'Hot'},
    [37] = {'Isolated Thunderstorms'},
    [38] = {'Scattered Thunderstorms'},
    [39] = {'Scattered Thunderstorms'},
    [40] = {'Scattered Showers'},
    [41] = {'Heavy Snow','󰼶 '},
    [42] = {'Scattered Snow'},
    [43] = {'Heavy Snow','󰼶 '},
    [44] = {'Partly Cloudy'},
    [45] = {'Thunderstorm'},
    [46] = {'Snow Showers'},
    [47] = {'Isolated Thunderstorms'},
    [3200] = {'Not Available',''},

}


return {
    cond = cond,
    day=day,
    night=night,
}
