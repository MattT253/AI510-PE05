#refered base image from: https://hub.docker.com/_/python
FROM python:3.11-slim-bullseye

#copy current directory into docker container
COPY . .

#install necessary libraries
RUN pip install -r requirements.txt

# When the container starts, run "python app.py"
CMD ["python", "app.py"]