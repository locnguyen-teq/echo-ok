1. config.yaml -- k3d config file, run `k3d cluster create --config ./config.yaml`
2. kubectl apply --filename deploy.yaml
3. kubectl apply --filename service.yaml
4. kubectl apply --filename ingress.yaml
5. run localhost:8080/ok