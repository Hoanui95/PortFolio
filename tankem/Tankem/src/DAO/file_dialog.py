# coding: utf-8


from Tkinter import Tk
from tkFileDialog import askopenfilename
from tkFileDialog import asksaveasfilename


def select_open_csv():
    Tk().withdraw()
    return askopenfilename(filetypes = [("CSV files", "*.csv"), ("All files", "*")], defaultextension = "*.csv")

def select_save_as_csv():
    Tk().withdraw()
    return asksaveasfilename(filetypes = [("CSV files", "*.csv"), ("All files", "*")], defaultextension = "*.csv")