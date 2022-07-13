build:
	docker build --tag localhost:5000/arm-echo -f prod.Dockerfile .
	docker push localhost:5000/arm-echo:latest
	docker rmi localhost:5000/arm-echo
deploy:
	kubectl apply --filename deploy.yaml
	kubectl apply --filename service.yaml
	kubectl apply --filename ingress.yaml