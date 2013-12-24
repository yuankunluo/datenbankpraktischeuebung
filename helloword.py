# -*- coding: utf-8 -*-
from bottle import route, run, template, static_file

@route("/hello")
def hello():
    return "Hello Word:)."
@route('/')
@route('/hello/<name>')
def greet(name='Stranger'):
    return template('Hello {{name}}, how are you?', name=name)




run(host='127.0.0.1', port=8080, debug=True)
