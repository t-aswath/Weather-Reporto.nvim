from flask import Flask, request
import requests
from bs4 import BeautifulSoup
import json

app = Flask("app")


@app.route("/")
def hello_world():
  return "<p>Amsterdam,Netherlands</p>"


@app.route('/hello')
def hello():
  return 'Hello, World'


def fetch_data(city, country=""):
  url = "https://search.yahoo.com/search?ei=UTF-&p=weather+" + city + "+" + country
  html = requests.get(url)
  #city="Amsterdam"
  #state="Netherlands"

  # getting raw data
  soup = BeautifulSoup(html.text, 'html.parser')
  temp = soup.find('span', attrs={'class': 'currTemp'})
  _str = soup.find('span', attrs={'class': 'condition'})
  a = soup.find('p', attrs={'class': 'txt'})
  print(temp.text)
  print(_str.text)
  print(a.text)
  return f"Temperature : {temp} F , condition : {_str}"
  #return {"temp":temp,"report":_str}


@app.route('/login', methods=['GET', 'POST'])
def login():
  if request.method == 'GET':
    m = request.args.get('city')
    m2 = request.args.get('country')
    return fetch_data(m, m2)
  elif request.method == 'POST':
    print(request.text)
    return request.text


def run():
  app.run(host='0.0.0.0', port=8080, debug=True)


run()
