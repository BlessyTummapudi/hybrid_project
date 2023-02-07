from selenium import webdriver
from selenium.webdriver.common.by import By


class AmazonFlightsBooking:
    def __init__(self, executable_path):
        super().__init__(executable_path=executable_path)
        self.implicitly_wait(30)
        self.get('https://www.amazon.in/amazonpay/home')

    def sign_in(self, email, password):
        self.find_element(By.XPATH, "//span[text()='Hello, sign in']").click()
        self.find_element(By.NAME, "email").send_keys(email)
        self.find_element(By.XPATH, "//input[@id='continue']").click()
        self.find_element(By.NAME, "password").send_keys(password)
        self.find_element(By.XPATH, "//input[@id='signInSubmit']").click()

class Searchflight(AmazonFlightsBooking):

    def search_flight(self):
        self.find_element(By.XPATH, "//span[text()='Flights']").click()
        self.find_element(By.XPATH, "//button[text()='Search']").click()
        self.find_element(By.XPATH, "//button[text()='Book']").click()

    def add_traveller_details(self, first_name, last_name, email):
        self.find_element(By.LINK_TEXT, "Proceed to traveller details").click()
        self.find_element(By.XPATH, "//div[text()='Add new adult']").click()
        self.find_element(By.XPATH, "//button[text()='Select']").click()
        self.find_element(By.XPATH, "//li[text()='Ms']").click()
        self.find_element(By.ID, "input-firstName").send_keys(first_name)
        self.find_element(By.NAME, "lastName").send_keys(last_name)
        self.find_element(By.XPATH, "//button[text()='Add adult']").click()
        self.find_element(By.XPATH, "//i[@class='d726bd8f _4d2636f0']").click()
        self.find_element(By.NAME, "communication_email").send_keys(email)
        self.find_element(By.XPATH, "//button[normalize-space()='Proceed to review']").click()
        self.find_element(By.XPATH, "//i[@class='d726bd8f _4d2636f0']").click()
        self.find_element(By.XPATH, "//button[normalize-space()='Proceed to Payment']").click()
        self.find_element(By.XPATH, "//input[@name='ppw-instrumentRowSelection']").click()
        self.find_element(By.XPATH, "//input[@name='ppw-widgetEvent:AddCreditCardEvent']").click()

if __name__ == "__main__":
    obj = Searchflight      ()
    obj.sign_in()
    obj.search_flight()
    obj.add_traveller_details()