all: build


build:
	docker build -t nginx-oauth2-proxy .
