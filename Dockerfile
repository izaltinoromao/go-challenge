FROM golang:1.22 as builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN go build -o ./out/my-project .

FROM scratch 

COPY --from=builder /app/out/my-project /app

CMD ["/app"]