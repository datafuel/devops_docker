# devops_docker
Docker Image with tfenv (Multiple versions of Terraform) + Packer + AWS CLI

![Docker](https://github.com/raymar13/devops_docker/workflows/Docker/badge.svg)

# Prerequisites

- Docker (started) and docker-compose (just install Docker for Desktop if you are on laptop)
- AWS User + credentials

# Quickstart

1. Clone repo `git clone https://github.com/raymar13/devops_docker.git`
2. Run `cd devops_docker`
3. Duplicate the *.env.example* , rename it to *.env* and replace dummy values with yours
4. To build the image run :
```
docker compose -f /docker_build/docker-compose.yml build
``` 
5. To launch the container run :
```
docker-compose up -d
``` 
6. To ssh into the container run :
```
docker exec -it terraform_docker bash
```

## Organization
- Create modules inside **/modules**
- Call modules or create plain terraform projects inside **/environments**