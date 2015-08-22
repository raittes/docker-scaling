build:
	docker build -t nginx-consul .

run:
	docker run --name nginx-consul -it -v $(PWD):/tmp -p 8088:80 nginx-consul

kill:
	docker rm -f nginx-consul
