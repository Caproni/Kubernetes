kubectl create namespace postgres
kubectl label namespace postgres app.kubernetes.io/managed-by=Helm
kubectl annotate namespace postgres meta.helm.sh/release-namespace=postgres
kubectl annotate namespace postgres meta.helm.sh/release-name=postgres
echo "Create a password using: kubectl create secret generic postgres-secret --from-literal=postgres-password=your_password_here --namespace postgres"
helm install postgres . --namespace postgres
