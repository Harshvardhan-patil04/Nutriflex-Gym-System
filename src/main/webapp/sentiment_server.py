from flask import Flask, request, jsonify
from textblob import TextBlob

app = Flask(__name__)

@app.route('/sentiment', methods=['POST'])
def sentiment():
    data = request.get_json()
    text = data.get("text", "")
    analysis = TextBlob(text)
    polarity = analysis.sentiment.polarity

    if polarity >= 0.3:
        label = "Positive"
    elif polarity <= -0.1:
        label = "Negative"
    else:
        label = "Neutral"

    return jsonify({"sentiment": label})
