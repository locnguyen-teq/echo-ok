build:
	docker build --tag k3d-arm-registry.localhost:59873/arm-echo -f prod.Dockerfile .
	docker push k3d-arm-registry.localhost:59873/arm-echo:latest
	docker rmi k3d-arm-registry.localhost:59873/arm-echo
deploy:
	kubectl apply --filename k3d/deploy.yaml
	kubectl apply --filename k3d/ingress.yaml
	kubectl apply --filename k3d/service.yaml
	kubectl apply --filename k3d/app.yaml