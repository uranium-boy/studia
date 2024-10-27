# -*- coding: utf-8 -*-
"""
Created on Sat Oct 26 17:23:12 2024

@author: haenim
"""

import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, mean_absolute_percentage_error

def wykresy():
    macierz_korelacji = dane.corr()

    liczba_kolumn = len(kolumny)
    fig, ax = plt.subplots(nrows=4, ncols=4, figsize=(20, 20))

    for i in range(4):
        for j in range(4):
            index = i * 4 + j
            if index < liczba_kolumn - 1:
                ax[i, j].scatter(X[:, index], Y)
                ax[i, j].set_xlabel(kolumny[index])
                ax[i, j].set_ylabel(kolumny[-1])
                # Calculate and plot the trend line
                m, b = np.polyfit(X[:, index], Y, 1)  # Linear fit (slope m, intercept b)
                ax[i, j].plot(X[:, index], m * X[:, index] + b, color='red')  # Plot trend line
    plt.tight_layout()
    plt.savefig("korelacja.png")

def testowanie(maks):
    sredni_blad = 0
    for i in range(maks):
        X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, shuffle=True)
        model = LinearRegression()
        outliers = np.abs((Y_train - Y_train.mean()) / Y_train.std()) > 3
        X_train_no_outliers = X_train[~outliers, :]
        Y_train_no_outliers = Y_train[~outliers]

        # ponowne trenowanie modelu na danych bez wartosci odstajacych
        model.fit(X_train_no_outliers, Y_train_no_outliers)
        Y_pred = model.predict(X_test)
        mape = mean_absolute_percentage_error(Y_test, Y_pred)
        print(f'{i}. MAPE = {mape}')
        sredni_blad += mape
    return sredni_blad / maks

dane = pd.read_csv("practice_lab_2.csv", sep=";")
kolumny = dane.columns.to_list()
wartosci = dane.values

X = wartosci[:, : -1]
Y = wartosci[:, -1]

# wykresy()

sredni = testowanie(100)
print(f'Sredni blad: {sredni}')