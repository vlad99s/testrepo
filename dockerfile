# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget

# Download and extract Prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.30.3/prometheus-2.30.3.linux-amd64.tar.gz && \
    tar xvfz prometheus-2.30.3.linux-amd64.tar.gz && \
    mv prometheus-2.30.3.linux-amd64 prometheus && \
    rm prometheus-2.30.3.linux-amd64.tar.gz

# Copy your Prometheus configuration file to the container
#COPY prometheus.yml /prometheus/prometheus.yml

# Expose Prometheus web UI and API port
EXPOSE 9090

# Start Prometheus with the provided configuration file
CMD ["/prometheus/prometheus", "--config.file=/prometheus/prometheus.yml"]

