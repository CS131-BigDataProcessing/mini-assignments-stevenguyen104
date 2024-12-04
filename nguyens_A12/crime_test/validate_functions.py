#validate_functions.py
import pandas as pd

def validate(df):
    ''' Function that validates sex and age columns to make sure they are correct and not NULL
        input: df object
        output: boolean
    '''
    sex = df['Vict sex'].isin(['M', 'F']) & df['Vict sex'].notnull()

    age = df['Vict age'].between(1, 100) & df['Vict age'].notnull()

    if (sex.all() and age.all()):
        return True
    return False