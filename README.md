# Docker-Scaling demo

This demonstration implements an scalable web-server architecture using Docker containers.

  - Tools: docker, docker-compose
  - Load balancer: HAProxy and Nginx
  - Backend: an simple api
  - Service Catalog: Consul
  - Template handling: Consul-Template
  
>Based on [DR CoN](https://www.airpair.com/scalable-architecture-with-docker-consul-and-nginx)

# Getting started

#### [Install Docker Compose](https://docs.docker.com/compose/install/)

#### Clone this repository with submodules
``` $ git clone https://github.com/raittes/docker-scaling.git --recursive ```

#### RUN DEMO!
``` $ make demo ```

#### URLs
  - Nginx LB: [http://localhost:8088](http://localhost:8088)
  - HAProxy LB: [http://localhost:8080](http://localhost:8080)
  - HAProxy Stats: [http://localhost:8081](http://localhost:8081)
  - Consul: [http://localhost:8500](http://localhost:8500)

# Or do it yourself!

#### Build images
``` $ docker-compose build ```

#### Update Consul IP (generates docker-compose.yml)
``` $ make update-consul-ip ```

#### Start
``` $ docker-compose up ```

#### Scale
``` $ docker-compose scale app=10 ```


