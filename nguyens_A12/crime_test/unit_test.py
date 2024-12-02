#unit_test.py

import unittest
import pandas as pd
from crime_test.validate_functions import validate
from crime_test.stats_function import mean, median

class Test(unittest.TestCase):

    def setUp(self):
        # Example valid df for use
        self.df = pd.DataFrame({
            'Vict sex': ['M', 'F', 'M', 'M', 'F'],
            'Vict age': [64, 51, 35, 40, 29]
        })

    def test_valid_sex(self):
        self.assertTrue(validate(self.df))

    def test_invalid_sex(self):
        invalid = self.df.copy()
        # Not 'M' or 'F'
        invalid['Vict sex'] = ['M', 'Z', 'F', 'M', None]
        self.assertFalse(validate(invalid))
        # Null
        invalid['Vict sex'] = ['M', 'M', 'F', 'M', None]
        self.assertFalse(validate(invalid))

    def test_valid_age(self):
        self.assertTrue(validate(self.df))

    def test_invalid_age(self):
        invalid = self.df.copy()
        # Negative
        invalid['Vict age'] = [-10, 36, 100, 7, 19]
        self.assertFalse(validate(invalid))
        # Out of range
        invalid['Vict age'] = [10, 36, 101, 7, 19]
        self.assertFalse(validate(invalid))
        # Null
        invalid['Vict age'] = [10, 36, 100, 7, None]
        self.assertFalse(validate(invalid))

    def test_mean_age(self):
        self.assertEqual(mean(self.df), 43.8)

    def test_median_age(self):
        self.assertEqual(median(self.df), 40)

    def test_edge(self):
        empty = pd.DataFrame({'Vict sex': [], 'Vict age': []})
        # Should get nothing
        self.assertTrue(pd.isna(mean(empty)))
        self.assertTrue(pd.isna(median(empty)))

if __name__ == '__main__':
    unittest.main()