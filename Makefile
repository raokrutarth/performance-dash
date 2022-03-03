

all: start logs

start-build:
	docker-compose up --build -d

start:
	docker-compose up -d

logs:
	docker-compose logs -f

set-limits:
	docker update --memory=300M --cpus=1.25 performance-dash_cadvisor_1
	docker update --memory=300M --cpus=1.25 performance-dash_prometheus_1

# connect other containers not in dc file.
# connect-others:
# 	docker update performance-dash_prometheus_1 --link 


reload-prom:
	# to update config after prometheus.yml is updated
	curl -u `cat prom.auth` -X POST http://localhost:39090/-/reload

prom:
	docker-compose up -d prometheus
	make -s set-limits

# bare bones setup and monitoring
simple:
	docker-compose up -d cadvisor
	make -s set-limits

clean:
	docker-compose down --remove-orphans

cleanv:
	docker-compose down --remove-orphans --volumes

cleani:
	docker-compose down --remove-orphans --volumes --rmi all

clear-data: cleanv start

restart: clean start-build
