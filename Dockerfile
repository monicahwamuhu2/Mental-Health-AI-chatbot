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

# Ensure start.sh is executable
RUN chmod +x /app/start.sh

# Run the start.sh script
CMD ["/app/start.sh"]
