import logging

from behave import when

logger = logging.getLogger('forms')


@when('the user clears the "{element_name}"')
def clear_input(context, element_name):
    """ Tells the browser to clear the target input element

    This method only works with traditional HTML input elements.
    Your mileage-may-vary with browser plugins.

    ::

        When the user clears the "Prefilled Input"

    """
    logger.info(f'Clearing "{element_name}".')
    try:
        element = context.page[element_name]
    except context.page.ElementNotFound:
        raise AssertionError(f'The "{element_name}" was not found on the page.')

    element.clear()
