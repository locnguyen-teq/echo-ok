build:
	docker build --tag k3d-arm-registry.localhost:59873/arm-echo -f prod.Dockerfile .
	docker push k3d-arm-registry.localhost:59873/arm-echo:latest
	docker rmi k3d-arm-registry.localhost:59873/arm-echo
deploy:
	kubectl apply --filename deploy.yaml
	kubectl apply --filename service.yaml
	kubectl apply --filename ingress.yaml