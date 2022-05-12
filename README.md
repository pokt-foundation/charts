# POKT Foundation Helm Charts

## Install Argocd

```console
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

to get the admin password:

```console
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

Argocd does not expose the UI by default, so we will need to setup ingress for it. BUT in the mean time, we can just port-forward:

```console
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

open the browser to [http://localhost:8080/](http://localhost:8080/) and sign  in with `admin` and the password retrieved from above

## Usage

Add the Helm repository locally and update.

```bash
helm repo add pokt https://pokt-foundation.github.io/k8s/
helm repo update pokt
```

### Avalanche

Install the `pokt/avalanche` chart with the release name `avalanche` into the `avalanche` namespace.

```bash
helm install avalanche pokt/avalanche --create-namespace --namespace avalanche
```

### CICD

All charts in the [charts](/charts) directory are deemed ready to be published to our registry. They will need to pass a complete lint and test install (done with helm-chart-testing suite). 
Charts that are unstable must go to [incubator](/incubator) and be manually tested until promoted to the stable channel.