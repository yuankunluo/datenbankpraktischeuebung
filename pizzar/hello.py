# -*- coding: utf-8 -*-
from bottle import route, run, install, template
from bottle_sqlite import SQLitePlugin

install(SQLitePlugin(dbfile="pizza.db"))

@route("/")
@route("/hello")
@route("/hello/<name>")
def hello(name = "Stranger"):
    return template("hello", name = name)
    
run(host='127.0.0.1',port=8080 )
