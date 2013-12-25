# -*- coding: utf-8 -*-
import sqlite3

def get_producktlist():
    """Conntet to the db,
    then get all produckt list
    
    :returns: A list of tuple, every tuple is a tuple of database
    """
    # get connect
    try:
        conn = sqlite3.connect("pizza.db")
        # use row factory
        conn.row_factory = sqlite3.Row
    except:
        print("Database connect failure.")
        return []
    # get the cursor
    c = conn.cursor()
    c.execute("select * from Pizza")
    rows = c.fetchall()
    result = rowHandler(rows)
    # close the connection
    conn.close()
    return result

def rowHandler(rows):
    """Use the rows object, which resulted from sql quering.
    Then returns a list of tuple.
    The first element is the header, the other are tuples.
    
    :param rows: A rows from cursor.fetch_xxx()
    :type rows: sqlite3.Row
    :returns: A list of tuple
    """
    result = []
    keys = rows[0].keys()
    keys = tuple(keys)
    result.append(keys)
    for row in rows:
        r = []
        for key in keys:
            r.append(row[key])
        r = tuple(r)
        result.append(r)
    return result
    
        
    
    
    
    
    
