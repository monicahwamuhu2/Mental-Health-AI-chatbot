# Use Python 3.10 as base image
FROM python:3.10

# Set working directory inside the container
WORKDIR /app

# Copy only necessary files into the container (make sure to add .dockerignore for unwanted files)
COPY . .

# Upgrade pip and install dependencies in one step
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Expose the port for the app (Railway assigns it dynamically)
EXPOSE 8000

# Start the application using Railway's PORT environment variable
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "${PORT:-8000}"]
