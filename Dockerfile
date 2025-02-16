# Use Python 3.10 as base image
FROM python:3.10

# Set working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose a port (Railway sets this automatically)
EXPOSE 8080

# Run the application using Python to retrieve the PORT variable
CMD ["python", "-c", "import os; import uvicorn; uvicorn.run('api:app', host='0.0.0.0', port=int(os.getenv('PORT', 8080)))"]
