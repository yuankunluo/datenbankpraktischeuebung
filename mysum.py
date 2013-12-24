# -*- coding: utf-8 -*-
"""
Created on Sat Dec 14 23:43:09 2013

@author: yuankunluo
"""

class MySum:
    def __init__(self):
        self.count = 0

    def step(self, value):
        self.count += value

    def finalize(self):
        return self.count