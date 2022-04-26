# Ethereum Helm Chart

Integrate Ethereum into Kubernetes.

## Usage

Add the Helm repository locally and update.

```
helm repo add simbachain https://simbachain.gitlab.io/charts
helm repo update simbachain
```

Install the `simbachain/ethereum` chart with the release name `ethereum` into the `ethereum` namespace.

```
helm install ethereum simbachain/ethereum \
  --create-namespace \
  --namespace ethereum
```
