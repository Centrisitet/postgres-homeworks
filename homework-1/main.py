"""Скрипт для заполнения данными таблиц в БД Postgres."""

import psycopg2
from utils import get_data


con = psycopg2.connect(host='localhost', database='north', port='5432', user='postgres', password='123')
path_1 = 'north_data/employees_data.csv'
path_2 = 'north_data/customers_data.csv'
path_3 = 'north_data/orders_data.csv'

with con:
    with con.cursor() as cur:
        for data in get_data(path_2):
            cur.execute('INSERT INTO customers values (%s, %s, %s)', data)
        for data in get_data(path_1):
            cur.execute('insert into employees values (%s, %s, %s, %s, %s, %s)', data)
        for data in get_data(path_3):
            cur.execute('insert into orders values (%s, %s, %s, %s, %s)', data)

        cur.execute('select * from customers')
        rows = cur.fetchall()
        for row in rows:
            print(row)
