FROM caddy:builder-alpine AS builder

RUN xcaddy build --with github.com/divyam234/forwardproxy

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
