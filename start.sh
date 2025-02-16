#!/bin/sh

# Ensure PORT is set, default to 8080 if not provided
PORT=${PORT:-8080}

echo "Starting Uvicorn on port $PORT..."
exec uvicorn api:app --host 0.0.0.0 --port $PORT
