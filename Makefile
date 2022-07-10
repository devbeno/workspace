update: build push
build:
	docker buildx build -t devbens/workspace .
push:
	docker push devbens/workspace
dirs:
	mkdir -p /work /root /data /usr/local/env
shell: dirs
	docker run -it --rm \
		-v /work:/work \
		-v /data:/data \
		-v /root:/root \
		-v /usr/local/env:/usr/local/env \
		-v /var/run/docker.sock:/var/run/docker.sock \
		devbens/workspace zsh
