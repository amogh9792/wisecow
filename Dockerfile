# Use an official Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages and dos2unix
RUN apt-get update && \
    apt-get install -y cowsay fortune netcat dos2unix

# Set the working directory
WORKDIR /app

# Copy the script into the container
COPY wisecow.sh .

# Convert line endings to Unix style
RUN dos2unix wisecow.sh

# Make the script executable
RUN chmod +x wisecow.sh

# Update PATH to include /usr/games
ENV PATH="/usr/games:${PATH}"

# Verify installation of commands
RUN which cowsay && which fortune

# Expose the port
EXPOSE 4499

# Run the script
CMD ["./wisecow.sh"]
