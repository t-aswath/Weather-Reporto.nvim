# importing library
from flask import Flask
from flask import request
import requests as rq
from bs4 import BeautifulSoup

app = Flask(__name__)
@app.route('/',methods =['GET','POST'])

def weather():
  text = request.args.get('input')
  city=input("city : ")
  state=input("state : ")

  #creating url and requests instance
  url = "https://search.yahoo.com/search?ei=UTF-&p=weather+"+city+"+"+state
  html = rq.get(url)

  # getting raw data
  soup = BeautifulSoup(html.text, 'html.parser')
  temp = soup.find('span', attrs={'class': 'currTemp'})
  _str = soup.find('span', attrs={'class': 'condition'})
  a = soup.find('p', attrs={'class':'txt'})
  return [temp,_str,a]
