import psycopg2


# Функция выводит информацию о контракте по номеру арт-объекта
def scalarSQLrequest(cursor, objectID):
    cursor.execute("SELECT * FROM Contracts WHERE ArtObject = %(artobject)s", {"artobject": objectID})
    print(cursor.fetchone())


# Функция выводит название музея, арт-объект и художника
def multiplesJoinsSQLrequest(cursor):
    cursor.execute(
			"SELECT ao.Name AS ObjectName, m.Name AS MuseumName, ar.Name AS ArtistName " +
			"FROM ArtObjects AS ao JOIN Museums AS m " +
 			"ON ao.Museum = m.MuseumID " +
			"JOIN Artists AS ar " +
			"ON ao.Artist = ar.ArtistID "
		  )
    for row in cursor.fetchall():
        print(row)


def cteSQLrequest(cursor):
    cursor.execute(
			"WITH ContractCTE " +
			"AS ( SELECT ContractID, MuseumOwner, MuseumClient, DateOUT FROM Contracts ) " +
			"SELECT  ContractID, MuseumOwner, MuseumClient, DateOUT, min(DateOUT) OVER (PARTITION BY MuseumClient) " +
			"FROM ContractCTE;"
 		  )
    for row in cursor.fetchall():
        print(row)


# Функция выводит названия публичных таблиц
def metadataSQLrequest(cursor):
    cursor.execute("SELECT tablename FROM pg_tables " +
                   "WHERE schemaname = %(type)s", {"type":"public"}) 
    print("\nСписок public таблиц: ")
    for row in cursor.fetchall():
        print(row[0])


# Функция выводит максимальное количество экспонатов на выставках
def callSQLscalarFunction(cursor):
    cursor.execute("select * from getMaxExhibitNumber()")
    print("Максимальное количество экспонатов:")
    print(cursor.fetchall()[0][0])
    

    
def callSQLTableFunction(cursor, object):
    cursor.execute("select * from getArtObject(%(objectID)s)", {"objectID": object})
    print(cursor.fetchall())


def callSQLScalarProcedure(cursor, conn):
    id = input("Input Exhibition ID: ")
    numOfExhibit = input("Input new number of exhibit: ")

    cursor.execute("CALL updateExhibition(%(exh_id)s, %(new_num)s)", {"exh_id": id, "new_num":numOfExhibit})
    conn.commit()
    print("exhibition was succeesfully update")


# Функция выводит имя текущей базы данных
def systemSQLfunction(cursor):
    cursor.execute("SELECT current_database()")
    print(cursor.fetchall()[0][0])


# Функция создает таблицу для хранения информации об Арт-объектах
def createSQLtable(cursor, conn):
    cursor.execute("CREATE TABLE InfoAboutArtObject" +
                    " (ObjectID INT, dateOfcreation DATE, country TEXT)")
    conn.commit()


# Функция удаляет таблицу InfoAboutArtObject
def dropSQLtable(cursor, conn):
    cursor.execute("DROP TABLE InfoAboutArtObject")
    conn.commit()


# Фунция для добавления информации в таблицу InfoAboutArtObject
def fillSQLtable(cursor, conn, objectID, dateOfcreation, country):
    cursor.execute("INSERT INTO InfoAboutArtObject (objectID, dateOfcreation, country)" +
                    " VALUES (%s, %s, %s)", (objectID, dateOfcreation, country))
    conn.commit()





def menu(cursor, conn):
    while True:
        print('\n1 - Выполнить скалярный запрос;')
        print('2 - Выполнить запрос с несколькими соединениями (JOIN);')
        print('3 - Выполнить запрос с ОТВ (CTE) и оконными функциями;')
        print('4 - Выполнить запрос к метаданным;')
        print('5 - Вызвать скалярную функцию (написанную в третьей лабораторной работе);')
        print('6 - Вызвать многооператорную или табличную функцию (написанную в третьей лабораторной работе);')
        print('7 - Вызвать хранимую процедуру (написанную в третьей лабораторной работе);')
        print('8 - Вызвать системную функцию или процедуру;')
        print('9 - Создать таблицу в базе данных, соответствующую тематике БД;')
        print('10 - Выполнить вставку данных в созданную таблицу с использованием инструкции INSERT или COPY.')
        print('11 - Удалить ранее созданную таблицу.')
        print('\n0 - Выход\n')

        action = int(input("Выберите пункт из меню:"))

        if action == 0:
            return
        elif action == 1:
            objectID = int(input("Input object ID: "))
            scalarSQLrequest(cursor, objectID)
        elif action == 2:
            multiplesJoinsSQLrequest(cursor)
        elif action == 3:
            cteSQLrequest(cursor)
        elif action == 4:
            metadataSQLrequest(cursor)
        elif action == 5:
            callSQLscalarFunction(cursor)
        elif action == 6:
            objectID = input("Input object id: ")
            callSQLTableFunction(cursor, objectID)
        elif action == 7:
            callSQLScalarProcedure(cursor, conn)
        elif action == 8:
            systemSQLfunction(cursor)
        elif action == 9:
            createSQLtable(cursor, conn)
        elif action == 10:
            objectID = input("Input object ID: ")
            dateOfcreation = input("Input dateOfcreation: ")
            country = input("Input country: ")

            fillSQLtable(cursor, conn, objectID, dateOfcreation, country)
        elif action == 11:
            dropSQLtable(cursor, conn)
        else:
            print("Incorrect action, try again")




conn = psycopg2.connect(dbname='MuseumInfo', user='postgres',
                        password='s1s2s3s4', host='localhost')

cursor = conn.cursor()
menu(cursor, conn)
cursor.close()
conn.close()
