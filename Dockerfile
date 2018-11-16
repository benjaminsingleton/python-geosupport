FROM python:3.7-alpine

# Change version as necessary
ARG GEOSUPPORT_VERSION="18c"

RUN apk update && \
    apk add bash curl git libgcc unzip && \
    curl https://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/gdelx_$GEOSUPPORT_VERSION.zip -O -J -L && \
    unzip gdelx_$GEOSUPPORT_VERSION.zip -d /geosupport && \
    export UNZIPPED_FOLDER_NM="$(ls /geosupport/)" && \
    mv /geosupport/$UNZIPPED_FOLDER_NM /geosupport/app && \
    rm gdelx_$GEOSUPPORT_VERSION.zip
 
ENV GEOFILES="/geosupport/app/fls/" \
    LD_LIBRARY_PATH="/geosupport/app/lib"

RUN pip install git+git://github.com/benjaminsingleton/python-geosupport.git

RUN apk del curl unzip

CMD ["/bin/sh"]