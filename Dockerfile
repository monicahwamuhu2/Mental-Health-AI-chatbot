# Use Python 3.10 as base image
FROM python:3.10

# Set working directory inside the container
WORKDIR /app

# Copy project files into container
COPY . .

# Create a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for Railway
EXPOSE 8080

# Command to run the application
CMD ["python", "app.py"]
