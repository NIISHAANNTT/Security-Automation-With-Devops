# Use a base image with Python pre-installed
FROM python:3.9-slim

# Install Nmap and required dependencies
RUN apt-get update && \
    apt-get install -y nmap && \
    apt-get install -y python3-pip && \
    apt-get clean

# Install the Nmap Python library
RUN pip install python-nmap

# Create a directory for the application
WORKDIR /app

# Copy the Python script into the container
COPY code.py /app/code.py

# Run the Python script when the container starts
CMD ["python", "code.py"]

