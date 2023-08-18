#!/usr/bin/env python3
from flask import Flask, jsonify, request

app = Flask(__name__)

allowed_stream_keys = ["supersecret"]  # Add your allowed stream keys here


@app.route("/check_publish", methods=["GET", "POST"])
def check_publish():
    stream_key = request.args.get("name")  # Get the stream key from the query parameter

    if stream_key in allowed_stream_keys:
        return "OK", 200
    else:
        return "Unauthorized", 403


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
