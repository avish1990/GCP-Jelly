# Connect Kubernetes Cluster

gcloud container clusters get-credentials <ClusterName> --zone <Lcoation> --project <ProjectName>

# Create Secret for POD to use Service Account
kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=key.json

# DB Credentials

kubectl create secret generic cloudsql-db-credentials --from-literal=username=<> --from-literal=password=<>
