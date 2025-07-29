# Apply deployments
kubectl apply -f="kubernetes/users-deployment.yaml" -f="kubernetes/auth-deployment.yaml" -f="kubernetes/tasks-deployment.yaml" -f="kubernetes/frontend-deployment.yaml"

# Apply services
kubectl apply -f="kubernetes/users-service.yaml" -f="kubernetes/tasks-service.yaml" -f="kubernetes/auth-service.yaml" -f="kubernetes/frontend-service.yaml"