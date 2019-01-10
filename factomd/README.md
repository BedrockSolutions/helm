# factomd

The [Factom® protocol](https://www.factomprotocol.org/) is a decentralized, open source data integrity protocol built on blockchain technology.

## TL;DR;

```console
$ helm install factomd
```

## Introduction

This chart bootstraps a factomd deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prequisites

- Google Kubernetes Engine 1.11.5-gke.5+

## Installing the Chart

To install the chart with the release name `my-factomd`:

```console
$ helm install --name my-factomd factomd
```

This will deploy factomd on the Kubernetes cluster with the default (mainnet follower) configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-factomd` deployment:

```console
$ helm delete --purge my-factomd
```

## Configuration

The following table lists the configurable parameters of the factomd chart and their default values. The default network is set to mainnet.

| Parameter | Description | Default                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| - | - | - |
| `cloudProvider` | Cloud provider running Kubernetes. Currently, only GCP is supported.                                                         | `gcp`                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `factomd.args`                               | Override [Arguments](#arguments) to the factomd binary                                                                       | `{}`                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `factomd.config`                             | Override [configurations](#configurations) to the factomd config file                                                        | `{}`                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| `factomd.image`                              | factomd container image repository                                                                                           | `bedrocksolutions/factomd`                                                                                                                                                                                                                                                                                                                                                                                                               |
| `factomd.imageTag`                           | factomd container image tag                                                                                                  | `0.1.0`                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `factomd.resources.limits.cpu`               | factomd pod cpu limit                                                                                                        | `1000m`                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `factomd.resources.limits.memory`            | factomd pod memory limit                                                                                                     | `4Gi`                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `factomd.resources.requests.cpu`             | factomd pod cpu request                                                                                                      | `500m`                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `factomd.resources.requests.memory`          | factomd pod memory request                                                                                                   | `2Gi`                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `factomd.database.diskSize`                  | size of factomd persistent volume                                                                                            | `20Gi`                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `factomd.database.diskType`                  | type of factomd persistent volume, either standard or ssd                                                                    | `ssd`                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `factomd.isAuthority`                        | If true, use authority server settings in config                                                                             | `false`                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `factomd.network`                            | factom network to join, either mainnet or testnet                                                                            | `mainnet`                                                                                                                                                                                                                                                                                                                                                                                                                                |
| `factomd.ports.api.corsAllowedOrigin`        | CORS allowed origin for the api port. A Lua pattern may be specified                                                         | `none`                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `factomd.ports.api.loadBalancerType`         | Type of GCP load balancer to use for api service, either http, tcp, or none                                                  | `none`                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `factomd.ports.api.isInternal`               | If true, creates an internal load balancer, only works with loadBalancerType: tcp                                            | `false`                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `factomd.ports.cpanel.loadBalancerType`      | Type of GCP load balancer to use for control panel service, either http, tcp, or none                                        | `none`                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `factomd.ports.cpanel.isInternal`            | If true, creates an internal load balancer, only works with loadBalancerType: tcp                                            | `false`                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `prometheusToSD.resources.limits.cpu`        | prometheusToSD pod cpu limit                                                                                                 | `1000m`                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `prometheusToSD.resources.limits.memory`     | prometheusToSD pod memory limit                                                                                              | `4Gi`                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `prometheusToSD.resources.requests.cpu`      | prometheusToSD pod cpu request                                                                                               | `500m`                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| `prometheusToSD.resources.requests.memory`   | factomd pod memory request                                                                                                   | `2Gi`                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `statefulSet.replicas`                       | desired number of factomd replicas                                                                                           | `1`                                                                                                                                                                                                                                                                                                                                                                                                                                      |

### Arguments

Arguments are passed using the `factomd.args` key.

Valid arguments passed to the factomd binary:

| Argument | Description | Default | Network |
| - | - | - |
| customNet    | sets the `customnet` value | fct_community_test | testnet |
| faultTimeout | sets the `faulttimeout` time in seconds | 120 | both  |
| startDelay   | set the `startdelay` time in seconds | 600 | both  |

#### Example

```yaml
factomd:
  args:
    faultTimeout: 60
    startDelay: 300

```

### Configuration parameters

Configuration parameters are passed using the `factomd.config` key

Valid configuration file keys:

| Configuration | Description | Default | Network |
| - | - | - | - |
| `bootstrapIdentity` | sets the `CustomBootstrapIdentity` value | 8888882f5002ff95fce15d20ecb7e18ae6cc4d5849b372985d856b56e492ae0f | `testnet` |
| `bootstrapKey` | sets the `CustomBootstrapKey` value | 58cfccaa48a101742845df3cecde6a9f38037030842d34d0eaa76867904705ae | `testnet` |
| `changeAcksHeight` | sets the `ChangeAcksHeight` value | 0 | `both` |
| `controlPanelPortSetting` | sets the `ControlPanelPortSetting` value | readonly | `both` |
| `directoryBlockInSeconds` | sets the `DirectoryBlockInSeconds` value | mainnet: none; testnet: 600 | `both` |
| `exchangeRateAuthorityPublicKey` | sets the `ExchangeRateAuthorityPublicKey` value | mainnet: none; testnet: 58cfccaa48a101742845df3cecde6a9f38037030842d34d0eaa76867904705ae | `both` |
| `identityChainID` | sets the `IdentityChainID` value | none | `both` |
| `localServerPrivateKey` | sets the `LocalServerPrivateKey` value. A secret should be used instead | ${LOCAL_SERVER_PRIVATE_KEY} | `both` |
| `localServerPublicKey` | sets the `LocalServerPublicKey` value | none | `both` |
| `network` | sets the `Network` value | mainnet: MAIN; testnet: CUSTOM | `both` |
| `seedUrl` | sets the `MainSeedURL` (mainnet) or `CustomSeedURL` (testnet) value | mainnet: none; testnet: https://raw.githubusercontent.com/FactomProject/communitytestnet/master/seeds/testnetseeds.txt | `both` |
| `specialPeers` | sets the `MainSpecialPeers` (mainnet) or `CustomSpecialPeers` (testnet) value | mainnet: "52.17.183.121:8108 52.17.153.126:8108 52.19.117.149:8108 52.18.72.212:8108" | `both`  |
