from fastapi import FastAPI
import joblib
import random
from pydantic import BaseModel
import json

# Load trained model and preprocessing objects
clf = joblib.load("chatbot_model.pkl")
vectorizer = joblib.load("vectorizer.pkl")
label_encoder = joblib.load("label_encoder.pkl")

# Load intents
with open("intents.json", "r") as file:
    intents = json.load(file)

# Initialize FastAPI app
app = FastAPI()

# Request model
class ChatInput(BaseModel):
    text: str

# Define chatbot function
def chatbot_response(user_input):
    cleaned_input = user_input.lower()  
    input_vector = vectorizer.transform([cleaned_input])
    predicted_sentiment = label_encoder.inverse_transform(clf.predict(input_vector))[0]

    for intent in intents["intents"]:
        if predicted_sentiment in intent["tag"]:
            return random.choice(intent["responses"])

    return "I'm here to help. Tell me more about how you're feeling."

# API Endpoint
@app.post("/chat")
def get_chat_response(user_input: ChatInput):
    response = chatbot_response(user_input.text)
    return {"response": response}

# Run the server
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
