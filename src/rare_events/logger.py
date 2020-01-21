"""
This module contains the logging functions used throughout the
``rare_events`` package.
"""

import logging
from functools import wraps


def logger(orig_func):
    logging.basicConfig(
        filename='{}.log'.format(orig_func.__name__),
        level=logging.INFO
        )

    @wraps(orig_func)
    def wrapper(*args, **kwargs):
        logging.info(
            'Ran with args: {}, and kwargs: {}'.format(args, kwargs)
            )
        return orig_func(*args, **kwargs)

    return wrapper


def timer(orig_func):
    import time

    @wraps(orig_func)
    def wrapper(*args, **kwargs):
        t1 = time.time()
        result = orig_func(*args, **kwargs)
        t2 = time.time() - t1
        print('{} ran in: {} sec'.format(orig_func.__name__, t2))
        return result

    return wrapper
