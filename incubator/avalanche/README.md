# Avalanche Helm Chart

Helm chart for the Avalanche blockchain client.

## Usage

Add the Helm repository locally and update.

```bash
helm repo add pokt https://pokt-foundation.gitlab.io/charts
helm repo update pokt
```

Install the `pokt/avalanche` chart with the release name `avalanche` into the `avalanche` namespace.

```bash
helm install avalanche pokt/avalanche --create-namespace --namespace avalanche
```
