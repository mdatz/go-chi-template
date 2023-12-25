FROM golang:1.21 AS build

WORKDIR /build

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /chi-api

FROM build AS test
RUN go test -v ./...

FROM gcr.io/distroless/base-debian11 AS release

WORKDIR /

COPY --from=build /chi-api /chi-api

EXPOSE 2077

USER nonroot:nonroot

ENTRYPOINT ["/chi-api"]
