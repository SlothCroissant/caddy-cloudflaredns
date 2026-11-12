FROM caddy:2.11.9-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.11.9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
