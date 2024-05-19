import time
from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Chrome()
driver.maximize_window()
driver.get('https://practice-automation.com/form-fields')
search_name = driver.find_element(By.CSS_SELECTOR, 'input[data-cy="name"]')
search_name.send_keys("Катя")
search_water = driver.find_element(By.CSS_SELECTOR, '[id="drink1"]')
search_water.click()
coffee_checkbox = driver.find_element(By.CSS_SELECTOR, '[id="drink3"]')
coffee_checkbox.click()
wine_checkbox = driver.find_element(By.CSS_SELECTOR, '[id="drink4"]')
wine_checkbox.click()

time.sleep(5)

email_input = driver.find_element(By.CSS_SELECTOR, 'input[data-cy="email"]')
email_input.send_keys("qa31@yandex.ru")

time.sleep(5)

submit_button = driver.find_element(By.CSS_SELECTOR, 'button[data-cy="submit-btn"]')
submit_button.click()

time.sleep(5)

driver.quit()
