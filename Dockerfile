# Use the official Python image from the Docker Hub
FROM python:3.12-slim


#Copy the env file to the docker containers 'app' directory
COPY .env /app/.env
