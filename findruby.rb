require 'pry'
require 'selenium-webdriver'

browser = Selenium::WebDriver.for :firefox
browser.get 'http://www.amazon.co.uk'

search = browser.find_element name: "field-keywords"
search.send_key "eloquent ruby\n"

go = browser.find_element value: "nav-submit-input"
go.click

paperback = browser.find_element class: "lrg"
paperback.click

price = browser.find_element class: "a-color-price"
price.text[1..5]
