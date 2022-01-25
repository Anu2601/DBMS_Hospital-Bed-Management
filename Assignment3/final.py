import psycopg2
from psycopg2 import Error
try:
    # Connect to an existing database
    connection = psycopg2.connect(user="postgres",
                                  password="1234",
                                  host="localhost",
                                  port = "5432",
                                  database="covidhospital")


    cursor = connection.cursor()
    Select_query='''select * from patient'''
    
    cursor.execute(Select_query)
    rows = cursor.fetchall()
    for row in rows:
        print(row)
    


except:
    pass