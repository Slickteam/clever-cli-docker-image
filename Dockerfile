ARG TAG=latest
FROM debian:$TAG

LABEL authors="Slickteam"

RUN apt-get update && \
    apt install -y apt-transport-https ca-certificates curl gnupg git && \
    curl -fsSL https://clever-tools.clever-cloud.com/gpg/cc-nexus-deb.public.gpg.key | gpg --dearmor -o /usr/share/keyrings/cc-nexus-deb.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cc-nexus-deb.gpg] https://nexus.clever-cloud.com/repository/deb stable main" | tee -a /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y clever-tools && \
    apt-get clean
