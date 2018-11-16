FROM python:3.7-alpine

<<<<<<< HEAD
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
=======
ENV GEOFILES="/geosupport/version-18c_18.3/fls/" \
    LD_LIBRARY_PATH="/geosupport/version-18c_18.3/lib"

# Download and extract geosupport
RUN apk update && \
    apk add curl unzip git libgcc

RUN curl https://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/gdelx_18c.zip -O -J -L && \
    unzip gdelx_18c.zip -d geosupport && \
    rm gdelx_18c.zip

RUN pip install git+git://github.com/ishiland/python-geosupport.git
>>>>>>> accceb22411c288cc8a76d314e92d2c34d7ee1d7

CMD ["/bin/sh"]