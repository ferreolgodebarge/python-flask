from flask import Flask, render_template
from flask_script import Manager

app = Flask(__name__)

manager = Manager(app)

@app.route('/')
def home():
	return render_template('hello.html')

@app.route('/2')
def page2():
	return render_template('page2.html')

if __name__ == '__main__' :
	manager.run()
