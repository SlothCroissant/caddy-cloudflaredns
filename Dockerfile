FROM caddy:builder AS builder

RUN xcaddy build v2.3.0 \
    --with github.com/caddy-dns/cloudflare@eda8e5aa22232e9c279b0df7531f20c331b331c6

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
