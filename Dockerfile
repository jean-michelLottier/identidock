FROM python:3.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI==2.0.8 requests==2.5.1 redis==2.10.3
WORKDIR /app
COPY app /app
COPY cmd.sh /

#Declare the ports accessible to the host and other containers
EXPOSE 9090 9191
#Sets the user for the following lines
USER uwsgi

#CMD ["uwsgi","--http","0.0.0.0:9090","--wsgi-file","/app/identidock.py","--callable","app","--stats","0.0.0.0:9191"]
CMD ["/cmd.sh"]