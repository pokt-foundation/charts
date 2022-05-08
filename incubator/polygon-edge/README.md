# Avalanche Helm Chart

Helm chart for Polygon Edge.

## Usage

Add the Helm repository locally and update.

```bash
helm repo add pokt https://pokt-foundation.gitlab.io/charts
helm repo update pokt
```

Install the `pokt/polygon-edge` chart with the release name `polygon-edge` into the `polygon-edge` namespace.

```bash
helm install polygon-edge pokt/polygon-edge --create-namespace --namespace polygon-edge
```
