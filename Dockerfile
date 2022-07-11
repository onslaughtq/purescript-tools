FROM flipstone/stack:v5-2.7.3-arm64 AS builder

RUN apt-get update && apt-get install -y git curl

ADD build-purs.sh /build-purs.sh
RUN /build-purs.sh

ADD build-spago.sh /build-spago.sh
RUN /build-spago.sh

FROM arm64v8/debian:bullseye-20211220-slim

COPY --from=builder /usr/local/bin/purs /usr/local/bin/purs
COPY --from=builder /root/.local/bin/spago /usr/local/bin/spago 

ENTRYPOINT /usr/local/bin/spago
