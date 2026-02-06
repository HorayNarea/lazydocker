FROM golang:alpine AS build

ENV CGO_ENABLED=0

RUN apk add --no-cache \
  ca-certificates \
  git

RUN go install -v github.com/jesseduffield/lazydocker@latest


FROM scratch
COPY --from=build /go/bin/* /

CMD [ "/lazydocker" ]
