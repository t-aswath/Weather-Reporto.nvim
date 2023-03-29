# importing library
import requests
from bs4 import BeautifulSoup

# enter city name
city = "lucknow"

# creating url and requests instance
url = "https://search.yahoo.com/search?ei=UTF-8&fr=opera2&p=weather"
html = requests.get(url)

# getting raw data
soup = BeautifulSoup(html.text, 'html.parser')
temp = soup.find('span', attrs={'class': 'currTemp'})
_str = soup.find('span', attrs={'class': 'condition'})
print(temp.text)
print(_str.text)
# # formatting data
# data = _str.split('\n')
# time = data[0]
# sky = data[1]
#
# # getting all div tag
# listdiv = soup.findAll('div', attrs={'class': 'Uo8X3b OhScic zsYMMe'})
# strd = listdiv[5].text
#
# # getting other required data
# pos = strd.find('Wind')
# other_data = strd[pos:]
#
# # printing all data
# print("Temperature is", temp)
# print("Time: ", time)
#print("Sky Description: ", sky)
# print(other_data)


