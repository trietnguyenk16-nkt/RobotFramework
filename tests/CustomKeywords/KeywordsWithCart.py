from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class KeywordsWithCart:
    xpath_list_product_to_cart = "//h4[@class ='card-title']/a"

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def add_items_to_cart_custom(self, list_products):
        self.selLib.wait_until_element_is_visible(self.xpath_list_product_to_cart, 10, error="Element is not visible")
        list_product_webelements = self.selLib.get_webelements(self.xpath_list_product_to_cart)
        for product_web_element in list_product_webelements:
            product = self.selLib.get_text(product_web_element)
            if product in list_products:
                index = self.selLib.get_index_from_list(list_product_webelements,product_web_element)
                index += 1
                self.selLib.click_button("//div[@class='card-footer']/button)[" + index + "]")

    @keyword
    def goto_checkout_page_custom(self):
        self.selLib.scroll_to_element_into_view("//a[contains(text(), 'Checkout')]")
        self.selLib.click_element("//a[contains(text(), 'Checkout')]")