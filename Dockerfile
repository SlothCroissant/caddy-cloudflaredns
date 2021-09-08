FROM caddy:2.4.3-builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare

FROM caddy:2.4.3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
