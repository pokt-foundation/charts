# POKT Foundation Helm Charts

## Usage

Add the Helm repository locally and update.

```bash
helm repo add pokt https://pokt-foundation.github.io/charts
helm repo update pokt
```

### Avalanche

Install the `pokt/avalanche` chart with the release name `avalanche` into the `avalanche` namespace.

```bash
helm install avalanche pokt/avalanche --create-namespace --namespace avalanche
```
