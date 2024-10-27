# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, mean_absolute_percentage_error
from matplotlib import pyplot as plt

dane = pd.read_csv("practice_lab_2.csv", sep=";")

# wyodrebnienie nazw kolumn
kolumny = list(dane.columns)
# alternatywnie:
kolumny = dane.columns.to_list()

# list slicing syntax
# 1D_array[start : end : step]
# 2D_array[rows, columns]

# wyodrebnienie wartosci zbioru danych
wartosci = dane.values

# wyodrebnienie wartosci zbioru wejsciowego (wszystkie kolumny z wyjatkiem ostatniej)
X = wartosci[:, : -1]
# wyodrebnienie wartosci zbioru wyjsciowego (medianaowa cena, ostatnia kolumna)
Y = wartosci[:, -1]

# X_train - wejscie uczenia, Y_train - wyjscie uczenia
# X_test, Y_test - podzbior testowy (20%)
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, shuffle=True, random_state=21)

# inicjalizacja nowego obiektu klasy LinearRegression
model = LinearRegression()
# przekazanie danych do uczenia modelu
model.fit(X_train, Y_train)

# przewidywanie wyjscia dla nowego zakresu danych testowych
Y_pred = model.predict(X_test)

# wyznaczenie najmniejszej i najwiekszej wartosci wsrod obu zbiorow jako poczatek i koniec linii wykresu
minvalue = min([Y_test.min(), Y_pred.min()])
maxvalue = max([Y_test.max(), Y_pred.max()])

# tworzenie wykresu przewidywanego (os Y) vs rzeczywistego wyjscia (os X)
plt.scatter(Y_test, Y_pred)
# linia referencyjna Y_test[i] == Y_pred[i]
plt.plot([minvalue, maxvalue], [minvalue, maxvalue])
plt.xlabel("Y_test")
plt.ylabel("Y_pred")
plt.close()

# miary jakosci predykcji modelu
mae = mean_absolute_error(Y_test, Y_pred)
mse = mean_squared_error(Y_test, Y_pred)
mape = mean_absolute_percentage_error(Y_test, Y_pred)

print(f"MAE = {mae}\nMSE = {mse}\nMAPE = {mape}")

# metody zwiekszenia dokladnosci predykcji modelu - wartosci odstajace
# wyswietlanie wartosci odstajacych na wykresie pudelkowym
plt.boxplot(Y_train)
plt.title("Mediana wartosci mieszkania")

# usuniecie wartosci odstajacych
# outliers - maska wartosci boolowskich
outliers = np.abs((Y_train - Y_train.mean()) / Y_train.std()) > 3
X_train_no_outliers = X_train[~outliers, :]
Y_train_no_outliers = Y_train[~outliers]

# ponowne trenowanie modelu na danych bez wartosci odstajacych
model.fit(X_train_no_outliers, Y_train_no_outliers)

# przewidywanie wyjscia
Y_pred = model.predict(X_test)

# ponowna ocena predykcji modelu
mae = mean_absolute_error(Y_test, Y_pred)
mse = mean_squared_error(Y_test, Y_pred)
mape = mean_absolute_percentage_error(Y_test, Y_pred)

print(f"No outliers\nMAE = {mae}\nMSE = {mse}\nMAPE = {mape}")

# generowanie wykresu wag poszczegolnych cech niezaleznych
niezalezne_cechy = kolumny[: -1]
x = np.arange(len(niezalezne_cechy))
wagi = model.coef_

fig, ax =  plt.subplots(1, 1)
ax.bar(x, wagi)
ax.set_xticks(x)
ax.set_xticklabels(niezalezne_cechy, rotation=90)

# generacja nowych cech jako stosunku TlenkiAzotu do innych kolumn bazujac na ich wagach
nowe_dane = np.stack([
    X[:, 4] * X[:, 3],
    X[:, 4] / X[:, 5],
    X[:, 4] / X[:, 7],
    X[:, 4] / X[:, -1]
    ], axis = -1)
X_nowy = np.concatenate([X, nowe_dane], axis=-1)

X_train, X_test, Y_train, Y_test = train_test_split(X_nowy, Y, test_size=0.2, shuffle=True, random_state=26)
model = LinearRegression()
model.fit(X_train, Y_train)

Y_pred = model.predict(X_test)
mae = mean_absolute_error(Y_test, Y_pred)
mse = mean_squared_error(Y_test, Y_pred)
mape = mean_absolute_percentage_error(Y_test, Y_pred)

print(f"Nowe cechy\nMAE = {mae}\nMSE = {mse}\nMAPE = {mape}")