IP=$(shell make -s get-internal-ip)

get-internal-ip:
	@ip route get 8.8.8.8 | awk '{ printf $$NF; exit }'

get-external-ip:
	@curl https://api.ipify.org

update-consul-ip:
	@echo Replacing IP by $(IP)
	cp docker-compose.yml-sample docker-compose.yml
	sed -i.bak "s@-advertise .* -@-advertise $(IP) -@" docker-compose.yml
	sed -i.bak "s@consul://.*\..*:8500@consul://$(IP):8500@" docker-compose.yml

	# Haproxy container points to Consul
	sed -i.bak "s@-consul .*\..*:8500@-consul $(IP):8500@" lb-haproxy/Dockerfile


build:
	make update-consul-ip
	docker-compose build
up:
	docker-compose up -d
stop:
	docker-compose stop
rm:
	docker-compose rm

demo:
	make update-consul-ip
	docker-compose build
	make up
	sleep 30
	docker-compose scale app=5
	sleep 30
	docker-compose scale app=10
	sleep 30
	docker-compose scale app=20
	sleep 30
	docker-compose scale app=2
	@echo "DONE!"
