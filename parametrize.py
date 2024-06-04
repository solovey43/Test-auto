from selenium import webdriver
from selenium.webdriver.common.by import By
import pytest

@pytest.mark.parametrize(
    'creds',
    [  pytest.param(('user1@mail.com','ffff'), id='user1@mail.com,ffff'),
       pytest.param(('user2@mail.com','cccc'), id='user2@mail.com,cccc'),
       pytest.param(('user3@mail.com','bbbb'), id='user3@mail.com,bbbb')
    ]
)
def test_login(creds):
    login,passw=creds
    driver=webdriver.Chrome()
    driver.implicitly_wait(5)
    driver.get('https://magento.softwaretestingboard.com/customer/account/login')
    driver.find_element(By.ID, 'email').send_keys(login)
    driver.find_element(By.ID, 'pass').send_keys(passw)
    driver.find_element(By.ID, 'send2').click()
    error_text=driver.find_element(By.CSS_SELECTOR,'[data-ui-id="message-error"]').text
    assert('The account sign-in was incorrect or your account is disabled temporarily. '
           'Please wait and try again later.'== error_text)


