import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.linear_model import LinearRegression
model = LinearRegression()
# 머신러닝 라이브러리
# pip install scikit-learn
df = pd.read_csv("./datasets/heights.csv")
x = df['height']
y = df['weight']
model.fit(x.values.reshape(-1, 1), y)
print('기울기:', model.coef_)
print('y절편:', model.intercept_)
plt.plot(x, y, 'o')
plt.plot(x, model.predict(x.values.reshape(-1, 1)))
plt.show()
print('test:', model.predict([[70]]))
