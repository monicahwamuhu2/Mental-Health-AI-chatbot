import requests

url = "http://127.0.0.1:8000/chat"
data = {"text": "I feel stressed today."}

response = requests.post(url, json=data)
print(response.json())  # Should return chatbot response
