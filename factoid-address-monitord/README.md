# factoid-address-monitord

[factoid-address-monitord](https://github.com/Factoshi/factoid-address-monitord) helps users track the values of payments received to a FCT address in a fiat currency of their choice.

## TL;DR;

```console
$ helm install factoid-address-monitord
```

## Introduction

This chart bootstraps a factoid-address-monitord deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prequisites

- Google Kubernetes Engine 1.11.5-gke.5+

## Installing the Chart

To install the chart with the release name `my-factoid-address-monitord`:

```console
$ helm install --name my-factoid-address-monitord factoid-address-monitord
```

The command deploys factoid-address-monitord on the Kubernetes cluster with the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `factoid-address-monitord` deployment:

```console
$ helm delete --purge `factoid-address-monitord`
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the factoid-address-monitord chart and their default values.

| Parameter                                          | Description                                                                   | Default                                   |
| -------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------- |
| `factoidAddressMonitord.config`                    | [configurations](#configurations) to the factoid-address-monitord config file | `{}`                                      |
| `factoidAddressMonitord.env.bitcoinTaxSecretName`  |                                                                               |                                           |
| `factoidAddressMonitord.image`                     | factoid-address-monitord container image repository                           | `bedrocksolutions/factoidAddressMonitord` |
| `factoidAddressMonitord.imageTag`                  | factoid-address-monitord container image tag                                  | `latest`                                  |
| `factoidAddressMonitord.pullPolicy`                | factoid-address-monitord container image pull policy                          | `Always`                                  |
| `factoidAddressMonitord.resources.limits.cpu`      | factoid-address-monitord pod cpu limit                                        | `100m`                                    |
| `factoidAddressMonitord.resources.limits.memory`   | factoid-address-monitord pod memory limit                                     | `256Mi`                                   |
| `factoidAddressMonitord.resources.requests.cpu`    | factoid-address-monitord pod cpu request                                      | `50m`                                     |
| `factoidAddressMonitord.resources.requests.memory` | factoid-address-monitord pod memory request                                   | `96Mi`                                    |
| `factoidAddressMonitord.volumes.config.mountPath`  | config volume mount path                                                      | `/home/node/app/conf-template`            |
| `factoidAddressMonitord.volumes.csv.mountPath`     | csv volume mount path                                                         | `/home/node/app/csv`                      |
| `factoidAddressMonitord.volumes.db.mountPath`      | db volume mount path                                                          | `/home/node/app/db`                       |
| `persistentVolumeClaim.size`                       | Persistent Volume size                                                        | `10Gi`                                    |
| `statefulset.replicas`                             | desired number of factoid-address-monitord replicas                           | `1`                                       |
| `statefulset.restartPolicy`                        | factoid-address-monitord container restart policy                             | `Always`                                  |
| `storageClass.parameters.type`                     | type of storage                                                               | `pd-standard`                             |
| `storageClass.parameters.replication-type`         | persistent disk replication type                                              | `regional-pd`                             |
| `storageClass.provisioner`                         | factoid-address-monitord container restart policy                             | `kubernetes.io/gce-pd`                    |

### configurations

Valid configuration file keys:

| Configuration               | Description                                                          |
| --------------------------- | -------------------------------------------------------------------- |
| `address`                   | address you want to monitor                                          |
| `bitcoinTaxKey`             | bitcoin tax api key, only necessary if saveToBitcoinTax is true      |
| `bitcoinTaxSecret`          | bitcoin tax api secret, only necessary if saveToBitcoinTax is true   |
| `currency`                  | target fiat currency                                                 |
| `factomdHost`               | location of your factomd node; default is localhost                  |
| `factomdPort`               | port factomd node is listenging to; default is 8088                  |
| `nickname`                  | address nickname                                                     |
| `recordCoinbaseReceipts`    | true if you want to record coinbase transactions to this address     |
| `recordNonCoinbaseReceipts` | true if you want to record non-coinbase transactions to this address |
| `saveToBitcoinTax`          | true if you want to bitcoin.tax for this address, false otherwise    |
| `saveToCsv`                 | true if you want to create a csv for this address, false otherwise   |
