import psycopg2
from psycopg2 import Error, connect

try:
    # Connect to an existing database
    connection = psycopg2.connect(user="postgres",
                                  password="1234",
                                  host="localhost",
                                  port = "5432",
                                  database="covidhospital")
    cursor=connection.cursor()
    
    def patient():
        print("1.Display all the patients\n")
        print("2.Add a new patient\n")
        print("3.Delete a patient\n")
        print("4.Update existing record\n")
        choice1=int(input("Enter choice\n"))
        if choice1==1:
            select_query='''select * from patient'''
            cursor.execute(select_query)
            rows=cursor.fetchall()
            print("All Patients:\n")
            for row in rows:
                print(row)
        if choice1==2:
            h_reg=int(input("Enter your hospital registration number\n"))
            p_id=input("Enter patient id\n")
            name=input("Enter name\n")
            age=int(input("Enter age\n"))
            ph=int(input("Enter phone number\n"))
            sev=int(input("Enter severity on a scale of 0 to 10\n"))
            cursor.execute("INSERT INTO patient(h_regno,p_id,p_name,p_age,p_phone,severity) VALUES(%s,%s,%s,%s,%s,%s)", (h_reg,p_id,name,age,ph,sev)) 
            connection.commit()
            print("Record inserted successfully into patient table")
            connection.close()
        if choice1==3:
            p_id=input("Enter the id of patient you wish to delete\n")
            
            try:
                # Execute the SQL command
                cursor.execute("delete from patient where p_id = %s",(p_id,))
                
                # Commit your changes in the database
                connection.commit()
            except:
                # Roll back in case there is any error
                connection.rollback()

            #Retrieving data
            print("Contents of the table after delete operation ")
            cursor.execute("select * from patient")
            rows=cursor.fetchall()
            for row in rows:
                print(row)

            #Closing the connection
            connection.close()
        if choice1==4:
            p_id=input("Enter the id of patient you wish to update\n")
            h_reg=input("Enter your hospital registration number\n")
            name=input("Enter name\n")
            age=input("Enter age\n")
            ph=input("Enter phone number\n")
            sev=input("Enter severity on a scale of 0 to 10\n")
            
            print("Table Before updating record ")
            sql_select_query = """select * from patient where p_id = %s"""
            cursor.execute(sql_select_query, (p_id,))
            record = cursor.fetchone()
            print(record)

            # Update single record now
            sql_update_query = """Update patient set h_regno=%s,p_name=%s,p_age=%s,p_phone=%s,severity=%s WHERE p_id=%s"""
            cursor.execute(sql_update_query, (h_reg,name,age,ph,sev,p_id))
            connection.commit()
            count = cursor.rowcount
            print(count, "Record Updated successfully ")

            print("Table After updating record ")
            sql_select_query = """select * from patient where p_id = %s"""
            cursor.execute(sql_select_query, (p_id,))
            record = cursor.fetchone()
            print(record)
    def doctor():
        print("1.Display all the doctors\n")
        print("2.Add a new doctor\n")
        print("3.Delete a doctor\n")
        print("4.Update existing record\n")
        print("5.Make a diagnosis and prescribe medicine\n")
        choice2=int(input("Enter choice\n"))
        if choice2==1:
            select_query='''select d_name from doctor'''
            cursor.execute(select_query)
            rows=cursor.fetchall()
            print("All Doctors:\n")
            for row in rows:
                print(row)
        if choice2==2:
            d_id=input("Enter doctor id:\n")
            d_name=input("Enter name:\n")
            d_phone=int(input("Enter phone number\n"))
            h_regno=int(input("Enter your hospital registration number:\n"))
            cursor.execute("INSERT INTO doctor(d_id,d_name,d_phone,h_regno) VALUES(%s,%s,%s,%s)",(d_id,d_name,d_phone,h_regno))
            connection.commit()
            print("1 record inserted successfully")
            connection.close()
        if choice2==3:
            d_id=input("Enter the id of the doctor you wish to delete\n")
            try:
                # Execute the SQL command
                cursor.execute("delete from doctor where d_id = %s",(d_id,))
                
                # Commit your changes in the database
                connection.commit()
            except:
                # Roll back in case there is any error
                connection.rollback()

            #Retrieving data
            print("Contents of the table after delete operation ")
            cursor.execute("select * from doctor")
            rows=cursor.fetchall()
            for row in rows:
                print(row)
        if choice2==4:
            d_id=input("Enter doctor id:\n")
            d_name=input("Enter name:\n")
            d_phone=int(input("Enter phone number\n"))
            h_regno=int(input("Enter your hospital registration number:\n"))
            
            print("Table Before updating record ")
            sql_select_query = """select * from doctor where d_id = %s"""
            cursor.execute(sql_select_query, (d_id,))
            record = cursor.fetchone()
            print(record)

            # Update single record now
            sql_update_query = """Update doctor set d_name=%s,d_phone=%s,h_regno=%s WHERE d_id=%s"""
            cursor.execute(sql_update_query, (d_name,d_phone,h_regno,d_id))
            connection.commit()
            count = cursor.rowcount
            print(count, "Record Updated successfully ")

            print("Table After updating record ")
            sql_select_query = """select * from doctor where d_id = %s"""
            cursor.execute(sql_select_query, (d_id,))
            record = cursor.fetchone()
            print(record)
        if choice2==5:
            pres_no=input("Enter the prescription number\n")
            med_name=input("Enter the medicine name that you want to prescribe\n")
            p_id=input("Enter the patient id\n")
            d_id=input("Enter the doctor's id\n")
            med_id=input("Enter the medicine id\n")
            
            cursor.execute("INSERT INTO medicine(med_id,med_name) VALUES (%s,%s)",(med_id,med_name))
            connection.commit()
            print("Added 1 record to medicine table successfully")
            cursor.execute("INSERT INTO prescription(pres_no,p_id,med_id,d_id) VALUES (%s,%s,%s,%s)",(pres_no,p_id,med_id,d_id))
            connection.commit()
            print("Added 1 record to prescription table successfully")
            connection.close()
    def bed():
        print("1.See availability in each hospital\n")
        print("2.Book a bed\n")
        print("3.See the occupied beds with patient details\n")
        choice3=int(input("Enter your choice\n"))
        if choice3==1:
            select_query='''select availability,h_location from hospital'''
            cursor.execute(select_query)
            rows=cursor.fetchall()
            print("Availability and the Area:\n")
            for row in rows:
                print(row)
        if choice3==2:
            area=input("Enter your area and check availability\n")
            cursor.execute("select availability from hospital where h_location=%s",(area,))
            rows=cursor.fetchall()
            print("Area and Availability:\n")
            for row in rows:
                print(row)
                if row!=0:
                    print("You can go ahead with your booking\n")
                    h_regno=int(input("Enter your hospital registration number\n"))
                    p_id=input("Enter patient ID\n")
                    b_id=input("Enter bed ID\n")
                    inn=input("Enter starting date\n")
                    out=input("Enter the leaving date\n")
                    cursor.execute("INSERT INTO bed_patient(h_regno,in_date,out_date,p_id,b_id) VALUES(%s,%s,%s,%s,%s)", (h_regno,inn,out,p_id,b_id)) 
                    connection.commit()
                    print("Bed Booked successfully ")
                    row=row-1
                    print("remaining availability\n")
                    connection.close()
                    
                    print(row)
                elif row==0:
                    print("Sorry!!..you can enter the waiting list\n")
                    sev=input("Enter severity of patient\n")
                    name=input("Enter name of patient\n")
                    wait_id=input("Enter your wait ID\n")
                    age=int(input("Enter age\n"))
                    ph=int(input("Enter phone number\n"))
                    h_regno=int(input("Enter your hospital registration number\n"))
                    address=input("Enter your area\n")
                    cursor.execute("INSERT INTO waiting(severity,name,wait_id,phone_no,age,address,h_regno) VALUES(%s,%s,%s,%s,%s,%s,%s)", (sev,name,wait_id,ph,age,address,h_regno)) 
                    connection.commit()
                    print("Record inserted successfully into waiting table")
                    connection.close()
            

        if choice3==3:
            select_query='''select p_id,b_id,h_regno from bed_patient'''
            cursor.execute(select_query)
            rows=cursor.fetchall()
            print("Beds Occupied:\n")
            for row in rows:
                print(row)
            select_query1='''select h_regno,icu_no,p_id from icu'''
            cursor.execute(select_query1)
            rowss=cursor.fetchall()
            print("ICU Beds Occupied:\n")
            for ro in rowss:
                print(ro)



    while 1:
        print("Welcome to Covid Bed Management\n")
        print("1.Patient\n")
        print("2.Doctor\n")
        print("3.Bed Allotment\n")
        print("4.Exit")
        choice=int(input("Pick your choice:\n"))
        if choice==1:
            patient()
        if choice==2:
            doctor()
        if choice==3:
            bed()
        if choice==4:
            exit()
    

except:
    pass