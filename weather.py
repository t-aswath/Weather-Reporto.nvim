# importing library
import requests
from bs4 import BeautifulSoup

country = "india"

state = "delhi"

# creating url and requests instance
url = "https://search.yahoo.com/search?ei=UTF-8&fr=opera2&p=weather+"+country+"+"+state
html = requests.get(url)

# getting raw data
soup = BeautifulSoup(html.text, 'html.parser')
temp = soup.find('span', attrs={'class': 'currTemp'})
_str = soup.find('span', attrs={'class': 'condition'})
print(temp.text+"*F")
print(_str.text)
