import logging
import splinter.exceptions
import selenium.common.exceptions

from behave import when, given
from veripy import custom_types  # noqa

logger = logging.getLogger('navigation')


@given(
    'the user clicks on the {position:d}{ordinal:ordinal_indicator} {words} '
    'in the "{element_name}"'
)
@when(
    'the user clicks on the {position:d}{ordinal:ordinal_indicator} {words} '
    'in the "{element_name}"'
)
def when_click_nth_element(context, position, ordinal, words, element_name):
    """ Tells the browser to click on the nth element within the element of the given identifier.
    ::

        When the user clicks on the 2nd Entry in the "Table"
    """
    logger.info(f'Clicking on {position}{ordinal} "{words}" of the element: "{element_name}".')

    try:
        page_element = context.page[element_name]
    except context.page.ElementNotFound:
        raise AssertionError(f'The {element_name} was not found on the page')
    try:
        nth_element = page_element.find_by_xpath(f'.//{words}')[position-1]
    except (IndexError, splinter.exceptions.ElementDoesNotExist):
        raise AssertionError(f'The {element_name} does not have a {position}{ordinal} {words}')
    try:
        nth_element.click()
    except (AttributeError, selenium.common.exceptions.ElementNotVisibleException):
        raise AssertionError(
            f'The {element_name} does not have a {position}{ordinal} {words} that is clickable'
            )
