FROM nginx
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-23.0.1-ce.tgz \
  && tar xzvf docker-23.0.1-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-23.0.1-ce.tgz
COPY index.html /usr/share/nginx/html
COPY jenkins.html /usr/share/nginx/html
COPY docker.html /usr/share/nginx/html
COPY kubernetes.html /usr/share/nginx/html
COPY terraform.html /usr/share/nginx/html
COPY devops6.1.png /usr/share/nginx/html
COPY do.png /usr/share/nginx/html
EXPOSE 80
