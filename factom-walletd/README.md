# factom-walletd

The [factom-walletd](https://github.com/FactomProject/factom-walletd) serves the factom/wallet/wsapi interface to the wallet library at factom/wallet.

## TL;DR;

```console
$ helm install factom-walletd
```

## Introduction

This chart bootstraps a factom-walletd deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prequisites

- Google Kubernetes Engine 1.11.5-gke.5+

## Installing the Chart

To install the chart with the release name `my-factom-walletd`:

```console
$ helm install --name my-factom-walletd factom-walletd
```

The command deploys factom-walletd on the Kubernetes cluster with the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `factom-walletd` deployment:

```console
$ helm delete --purge `factom-walletd`
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the factom-walletd chart and their default values.

| Parameter                                 | Description                               | Default                           |
| ----------------------------------------- | ----------------------------------------- | --------------------------------- |
| `factomWalletd.image`                     | factom-walletd container image repository | `bedrocksolutions/factom-walletd` |
| `factomWalletd.imageTag`                  | factom-walletd container image tag        | `latest`                          |
| `factomWalletd.resources.limits.cpu`      | factom-walletd pod cpu limit              | `500m`                            |
| `factomWalletd.resources.limits.memory`   | factom-walletd pod memory limit           | `1Gi`                             |
| `factomWalletd.resources.requests.cpu`    | factom-walletd pod cpu request            | `500m`                            |
| `factomWalletd.resources.requests.memory` | factom-walletd pod memory request         | `1Gi`                             |
| `deployment.replicas`                     | desired number of factom-walletd replicas | `1`                               |
