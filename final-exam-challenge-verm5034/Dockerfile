FROM ubuntu:xenial
EXPOSE 8090
COPY /webapp/* /webapp/
ENTRYPOINT ["python"]
CMD ["/webapp/appserver.py"]
