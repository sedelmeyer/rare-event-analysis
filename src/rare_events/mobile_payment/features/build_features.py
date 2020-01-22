import os
import logging

import pandas as pd

from ...logger import logger, timer


log_file = "build_features.log"
log_level = logging.INFO
logging.basicConfig(
    level=log_level, filename=log_file, filemode="w+",
    format="%(asctime)-15s %(levelname)-8s %(message)s"
    )



@logger
@timer
def readfile(filename, low_memory, **kwargs):
    """Reads a csv file to a pandas.DataFrame

    :param filename: name of file
    :type filename: str
    :returns: pandas.DataFrame
    """
    df = pd.read_csv(filename, low_memory=low_memory, **kwargs)
    return df


@logger
def print_head(dataframe, lines=8):
    """
    prints the head of a dataframe
    """
    print(dataframe.head(lines))
    return None


class Features(object):
    """Provides functionality to create features from cleansed dataset

    Features provides base class methods to manage base read/write operations
    and feature engineering from cleansed survey data.
    """

    def __init__(self, input_df, copy_input):
        if copy_input:
            self.input_df = input_df.copy()  # input df persists for reference
        self.df = input_df  # all basedata changes applied to this df

    @classmethod
    @logger
    def from_file(cls, filename, copy_input=False, **read_kwargs):
        """Reads input csv, xls, or xlsx into Features.df as pandas.DataFrame

        Invokes Features class and reads input csv or excel from disk
        into a pandas.DataFrame object.

        :param filename: str filename of .csv, .xls, or .xlsx file to be read
        :param copy_input: bool to specify whether self.input_df persists
        :param read_kwargs: optional args to pandas.DataFrame.read_csv() or
                            pandas.DataFrame.read_excel()
        :return: pandas.DataFrame and copy_input bool as class variables
        """
        _, ext = os.path.splitext(filename)
        if ext == '.csv':
            input_df = pd.read_csv(filename, **read_kwargs)
        elif ext in ('.xls', '.xlsx'):
            input_df = pd.read_excel(filename, **read_kwargs)
        else:
            raise TypeError(
                'from_file reads only .csv, .xls, or .xlsx filetypes'
            )
        return cls(input_df, copy_input)
