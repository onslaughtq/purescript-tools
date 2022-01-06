FROM flipstone/stack:v5-2.7.3-arm64 AS builder

RUN apt-get update && apt-get install git

ADD build-purs.sh /build-purs.sh

RUN /build-purs.sh

FROM arm64v8/debian:bullseye-20211220-slim

COPY --from=builder /usr/local/bin/purs /usr/local/bin/purs

ENTRYPOINT /usr/local/bin/purs
