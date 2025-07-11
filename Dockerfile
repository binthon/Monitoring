FROM golang:1.22 AS builder

# użyj SHA zamiast tagu v1.35.2
RUN git clone https://github.com/influxdata/telegraf.git /telegraf
WORKDIR /telegraf

# checkout do konkretnego commita sprzed godebug
RUN git checkout 09f5d00570d8bc5297b4a9bcbd1a24cd7794b348

RUN go build -o telegraf ./cmd/telegraf

FROM debian:bullseye-slim
COPY --from=builder /telegraf/telegraf /usr/bin/telegraf
ENTRYPOINT ["/usr/bin/telegraf"]
