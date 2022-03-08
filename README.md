# Metrics Dashboard

Tools to monotor and visualise metrics from targets that expose
prometheus metrics.

Quick set of services to look at container level performance
of an application or set of services.

## Usage

Most containers are protected by hardcoded HTTP Basic Auth
credentials. DO NOT USE IN PRODUCTION.

Spin up the necessary services with the `docker-compose` command
and set the intended metrics targets in `prometheus/prometheus.yml`.

### cAdvisor webUI auth

Start with `dc up cadvisor` for minimal setup.

Auth created with `htpasswd -c ./cadvisor.auth dashboard`

dashboard:u0Zvv3jwvUEE

### Prometheus webUI auth

- Generate a hashed pasword with `python auth_gen.py`.
- For a username of choice, add entry to `prometheus/web.yml`
- Add plain text creds to `prom.auth` for the `make` reload target.

### Grafana webUI auth

TODO

## Resources

- `https://github.com/google/cadvisor/blob/master/docs/storage/prometheus.md`
