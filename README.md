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
helm repo add pokt https://pokt-foundation.gitlab.io/charts
helm repo update pokt
helm install avalanche pokt/avalanche --create-namespace --namespace avalanche
```

### Ethereum

Add the Helm repository locally and update.

```bash
helm repo add simbachain https://simbachain.gitlab.io/charts
helm repo update simbachain
helm install ethereum simbachain/ethereum --create-namespace --namespace ethereum
```

### Commit hooks

This repo uses pre-commit hooks for lint, syntax and documentation purposes. To setup this hook, simply go ahead and install `pre-commit` package.

For MacOS users:

```bash
brew install norwoodj/tap/helm-docs
brew install pre-commit
```

For Linux users, you can find the package in the [release page](https://github.com/norwoodj/helm-docs/releases).

Once installed you can simply run `pre-commit install` command.