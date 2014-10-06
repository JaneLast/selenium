require 'pry'
require 'selenium-webdriver'

# opens a firefox browser and goes to tumblr log in page
browser = Selenium::WebDriver.for :firefox
browser.get 'https://www.tumblr.com/login'

# inputs username and password into variables
inemail = browser.find_element name: "user[email]"
inpass = browser.find_element name: "user[password]"

# puts the username and password variables into the username/password form fields
inemail.send_keys "jkempton@testingcircle.com"
inpass.send_keys "tumbrlaccount"

# Go button clicked
go = browser.find_element id: "signup_forms_submit"
go.click

# Text button clicked
icontext = browser.find_element id: "new_post_label_text"
icontext.click

# Wait 5 seconds for the text box to load
sleep(5.0)

# Input "Hello World" into the text body
browser.find_element(id: "post_two_ifr").send_keys "Hello World"

# Post button clicked
postbutton = browser.find_element class: "create_post_button"
postbutton.click

# Click on the posts button 
posts = browser.find_element class: "posts"
posts.click

# Read in the latest posts body 
topPostContent = browser.find_element class: "post_body"

# Checks that the latest posts body and checks if it equals the correct phrase
if topPostContent.text == "Hello World" 
  puts "The post is correct"
else
  puts "The post is Incorrect"
end
binding.pry
