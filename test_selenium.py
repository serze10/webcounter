from selenium import webdriver

options = webdriver.ChromeOptions()
options.binary_location = "/usr/bin/google-chrome"

driver = webdriver.Chrome(options=options)
driver.get("https://example.com")
print(driver.title)
driver.quit()
