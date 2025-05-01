FROM caddy:2.10.0-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \    # Cloudflare DNS provider module
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \  # Reverse proxy for docker containers via labels
    --with github.com/greenpau/caddy-security   # Authentication Plugin for implementing Form-Based, Basic, Local, LDAP, OpenID Connect, OAuth 2.0, SAML Authentication; https://caddyserver.com/docs/modules/http.handlers.authenticator

FROM caddy:2.10.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]   # Override CMD to have the container run using the caddy docker-proxy command provided by https://github.com/lucaslorentz/caddy-docker-proxy plugin
