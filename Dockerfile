FROM python:3.7-alpine

ENV GEOFILES="/geosupport/version-18c_18.3/fls/" \
    LD_LIBRARY_PATH="/geosupport/version-18c_18.3/lib"

# Download and extract geosupport
RUN apk update && \
    apk add curl unzip git libgcc

RUN curl https://www1.nyc.gov/assets/planning/download/zip/data-maps/open-data/gdelx_18c.zip -O -J -L && \
    unzip gdelx_18c.zip -d geosupport && \
    rm gdelx_18c.zip

RUN pip install git+git://github.com/ishiland/python-geosupport.git

CMD ["/bin/sh"]