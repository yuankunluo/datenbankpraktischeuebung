# -*- coding: utf-8 -*-
from bottle import route, run, install, template , static_file
from bottle_sqlite import SQLitePlugin
import os
import bottle
import sqlhander as sql

# sqlplugin install & global templating dir setting
install(SQLitePlugin(dbfile="pizza.db"))
cur_path = os.path.dirname(os.path.abspath(__file__))

# set static_file dir
@route("/static/<filename>")
def get_static(filename):
    return static_file(filename, root = cur_path + "/static")

print(cur_path)
bottle.TEMPLATE_PATH.insert(0,cur_path+'/templates/')
@route("/")
@route("/hello")
@route("/hello/<name>")
def hello(name = "Stranger"):
    return template("hello", name = name)

@route("/pizza")
def pizza():
    productlist = sql.get_producktlist()
    return template("homepage", productlist = productlist)
    
run(host='127.0.0.1',port=8080 )
