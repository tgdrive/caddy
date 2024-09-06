FROM caddy:builder-alpine AS builder

ARG CADDY_VERSION

RUN xcaddy build ${CADDY_VERSION} --with github.com/caddyserver/forwardproxy \
   --with github.com/mholt/caddy-webdav

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
