import csv
import sys
import psycopg2
from psycopg2 import sql
import datetime

def main(csvfile):
    try:
        # DATABASE PARAMETERS
        hostname = '***'
        username = '***'
        password = '***'
        database = 'budget'
        table = 'statement'
        # INITIATE A CONNECTION
        conn = psycopg2.connect(host=hostname, user=username, password=password, dbname=database, connect_timeout=3)
        print('DB CONNECTION OPEN')
        cur = conn.cursor()
        # PER DEFAULT, WE DO NOT ALLOW INSERTs UNTIL WE KNOW THE LINE READ IN THE CSV IS NOT YET PRESENT IN THE DB
        can_insert = False
        # WE WANT THE WHOLE INSERT PROCESS BE A TRANSACTION, THUS START WITH BEGIN
        cur.execute("""BEGIN""", )
        with open(csvfile, 'rt') as csvfile:
            statement_reader = csv.reader(csvfile, delimiter=',', quotechar='"', skipinitialspace=True)
            getcatid_query = "select catid, name from category"
            for row in reversed(list(statement_reader)):
                date_split = tuple(map(int, row[0].split('/')))
                transdate = datetime.date(date_split[2], date_split[1], date_split[0])
                amount = float(row[1])
                description = row[2].split(' Value Date: ')[0]
                funds = float(row[3])
                try:
                    date_split = tuple(map(int, row[2].split(' Value Date: ')[1].split('/')))
                    value_date = datetime.date(date_split[2], date_split[1], date_split[0])
                    select_query = "SELECT transdate, amount, description, valuedate, funds FROM {} WHERE transdate = %s AND amount = %s AND description = %s AND valuedate = %s AND funds = %s"
                    insert_query = "INSERT INTO {} (transdate, amount, description, valuedate, funds, catid) VALUES (%s, %s, %s, %s, %s, %s)"
                    data = (transdate, amount, description, value_date, funds)
                except IndexError as e:
                    value_date = None
                    select_query = "SELECT transdate, amount, description, funds FROM {} WHERE transdate = %s AND amount = %s AND description = %s AND valuedate IS NULL AND funds = %s"
                    insert_query = "INSERT INTO {} (transdate, amount, description, funds, catid) VALUES (%s, %s, %s, %s, %s)"
                    data = (transdate, amount, description, funds)
                # Test if the line is not already in the database
                if(not can_insert):
                    cur.execute(sql.SQL(select_query).format(sql.Identifier(table)), data)
                    query_result = cur.fetchone()
                    if(not(query_result == data)):
                        can_insert = True;
                        cur.execute(sql.SQL(getcatid_query).format(sql.Identifier(table)), )
                        for cat in cur.fetchall():
                            print(cat)
                # If the data is not yet present, do INSERT
                if(can_insert):
                    # ASK THE USER TO PROVIDE THE CATEGORY ID FOR THE TO BE INSERTED STATEMENT
                    print('To be inserted: ' + description)
                    catid = int(input('Which category id? '))
                    data = data + (catid, )
                    print(cur.mogrify(sql.SQL(insert_query).format(sql.Identifier(table)), data))
                    cur.execute(sql.SQL(insert_query).format(sql.Identifier(table)), data)
        cur.execute("""COMMIT""", )
        cur.close()
        conn.close()
        print("DB CONNECTION CLOSED")
    except psycopg2.Error as e:
        print('NO DATABASE CONNECTION')
        print(e)
        sys.exit(1)
    except FileNotFoundError as e:
        print('ERROR WITH CSV')
        print(e)
        sys.exit(1)
    except IndexError as e:
        print('ISSUE WITH DATA INSIDE OF CSV')
        print(e)
        sys.exit(1)

if __name__=='__main__':
    sys.exit(main(sys.argv[1]))
