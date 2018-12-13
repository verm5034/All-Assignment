FROM ubuntu:16.04
LABEL maintainer=“Swati”
LABEL email=“verm5034@stthomas.edu”
RUN apt-get update -y
RUN apt-get install python-pip -y
RUN apt-get install python-dev -y
COPY /app/site.py /app/
COPY /app/requirements.txt /app/
EXPOSE 8080
RUN pip install -r /app/requirements.txt
CMD ["python","/app/site.py"]
