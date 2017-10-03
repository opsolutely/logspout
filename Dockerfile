FROM alpine:3.5
ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 9980

COPY . /src
RUN cd /src && ./build.sh "$(cat VERSION)"

ONBUILD COPY ./build.sh /src/build.sh
ONBUILD COPY ./modules.go /src/modules.go
ONBUILD RUN cd /src && ./build.sh "$(cat VERSION)-custom"
