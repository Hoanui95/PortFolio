# coding: utf-8


from Tkinter import Tk
from tkFileDialog import asksaveasfilename


def select_save_as_sql():
    Tk().withdraw()
    return asksaveasfilename(filetypes = [("SQL files", "*.sql"), ("All files", "*")], defaultextension = "*.sql")