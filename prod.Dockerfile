FROM golang:1.18-alpine as builder
RUN apk add --no-cache ca-certificates \
        dpkg \
        gcc \
        git \
        musl-dev \
        openssh
EXPOSE 1323
ENV APPDIR /app
WORKDIR $APPDIR
COPY go.mod .
COPY go.sum .
RUN go mod download
RUN ls
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -v -installsuffix cgo -o ./arm-echo ./main.go


FROM alpine:latest
RUN apk add --no-cache ca-certificates \
        socat
COPY --from=builder /app/arm-echo ./
CMD ["./arm-echo"]