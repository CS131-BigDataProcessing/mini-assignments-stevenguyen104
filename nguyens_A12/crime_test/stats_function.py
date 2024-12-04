#stats_function.py
import pandas as pd

def mean(df):
    ''' Function that calculates mean of the age column
        input: df object
        output: float
    '''
    return df['Vict age'].mean()

def median(df):
    ''' Function that calculates median of the age column
        input: df object
        output: float
    '''
    return df['Vict age'].median()
