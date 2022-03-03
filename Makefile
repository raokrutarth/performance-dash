

all: start logs

start-build:
	docker-compose up --build -d

start:
	docker-compose up -d

logs:
	docker-compose logs -f

reload-prom:
	# to update config after prometheus.yml is updated
	curl -X POST http://localhost:9090/-/reload

prom:
	docker-compose up prometheus

# bare bones setup and monitoring
cadv:
	docker-compose up -d cadvisor
	docker update --memory=300M --cpus=1.25 performance-dash_cadvisor_1

clean:
	docker-compose down --remove-orphans

cleanv:
	docker-compose down --remove-orphans --volumes

cleani:
	docker-compose down --remove-orphans --volumes --rmi all

clear-data: cleanv start

restart: clean start-build
