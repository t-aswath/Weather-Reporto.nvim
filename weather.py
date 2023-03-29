# importing library
import requests
from bs4 import BeautifulSoup

# creating url and requests instance
url = "https://search.yahoo.com/search?ei=UTF-8&fr=opera2&p=weather"
html = requests.get(url)

# getting raw data
soup = BeautifulSoup(html.text, 'html.parser')
temp = soup.find('span', attrs={'class': 'currTemp'})
_str = soup.find('span', attrs={'class': 'condition'})
print(temp.text)
print(_str.text)
