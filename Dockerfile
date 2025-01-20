FROM caddy:builder-alpine AS builder

ARG CADDY_VERSION

RUN xcaddy build ${CADDY_VERSION} \
   --with github.com/mholt/caddy-webdav \
   --with github.com/caddy-dns/cloudflare \
   --with github.com/mholt/caddy-l4

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
