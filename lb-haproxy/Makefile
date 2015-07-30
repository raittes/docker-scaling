build:
	docker build -t hadoxy .

run:
	docker run --name hadoxy -it -v $(PWD):/tmp -p 8080:8080 -p 8081:8081 hadoxy

kill:
	docker rm -f hadoxy
