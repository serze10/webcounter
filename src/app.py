from flask import Flask, redirect, render_template, request
from counter import Counter

app = Flask(__name__)
cnt = Counter()

@app.route("/")
def index():
    return render_template("index.html", value=cnt.value)

@app.route("/increment", methods=["POST"])
def increment():
    cnt.increase()
    return redirect("/")

@app.route("/reset", methods=["POST"])
def reset():
    cnt.reset()
    return redirect("/")


@app.route("/set", methods=["POST"])
def set_value():
    try:
        new_value = int(request.form.get("value", 0))
        cnt.value = new_value
    except ValueError:
        cnt.value = 0
    return redirect("/")

