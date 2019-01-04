# factomd

The [Factom® protocol](https://www.factomprotocol.org/) is a decentralized, open source data integrity protocol built on blockchain technology.

## TL;DR;

```console
$ helm install factomd
```

## Introduction

This chart bootstraps a factomd instance on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prequisites

- Google Kubernetes Engine 1.11.5-gke.5

## Installing the Chart

To install the chart with the release name `my-factomd`:

```console
$ helm install --name my-factomd factomd
```

This will deploy factomd on the Kubernetes cluster with the default (mainnet follower) configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-factomd` deployment:

```console
$ helm delete --purge `my-factomd`
```

## Configuration

The following table lists the configurable parameters of the factomd chart and their default values. The default network is set to mainnet.
Parameter | Description | Default
`cloudProvider` | Cloud provider running Kubernetes. Currently, only GCP is supported. | `GCP`
`factomd.args` | Override [Arguments](###arguments) to the factomd binary | `{}`
`factomd.config` | Override [configurations](###configurations) to the factomd config file | `{}`
`factomd.container.image` | factomd container image repository | `bedrocksolutions/factomd`
`factomd.container.imageTag` | factomd container image tag | `latest`
`factomd.container.resources.limits.cpu` | factomd pod cpu limit | `1000m`
`factomd.container.resources.limits.memory` | factomd pod memory limit | `4Gi`
`factomd.container.resources.requests.cpu` | factomd pod cpu request | `500m`
`factomd.container.resources.requests.memory` | factomd pod memory request | `2Gi`
`factomd.database.diskSize` | size of factomd persistent volume | `20Gi`
`factomd.database.diskType` | type of factomd persistent volume, either standard or ssd | `ssd`
`factomd.isAuthority` | If true, use authority server settings in config | `false`
`factomd.network` | factom network to join, either mainnet or testnet | `mainnet`
`factomd.ports.api.loadBalancerType` | Type of GCP load balancer to use for api service, either http, tcp, or none | `none`
`factomd.ports.api.isInternal` | If true, creates an internal load balancer, only works with loadBalancerType: tcp | `false`
`factomd.ports.cpanel.loadBalancerType` | Type of GCP load balancer to use for control panel service, either http, tcp, or none | `none`
`factomd.ports.cpanel.isInternal` | If true, creates an internal load balancer, only works with loadBalancerType: tcp | `false`
`factomd._args.defaults.global.faultTimeout` | default fault timeout | `120`
`factomd._args.defaults.global.startDelay` | start delay | `600`
`factomd._args.defaults.global.mainnet` | mainnet [arguments](###arguments) to pass to the factomd binary | `{}`
`factomd._args.defaults.global.testnet` | testnet [arguments](###arguments) to pass to the factomd binary | `customNet: fct_community_test`
`factomd._args.names.global` | dictionary mapping helm keys to factomd binary arguments | `faultTimeout: faulttimeout startDelay: startdelay`
`factomd._args.names.mainnet` | dictionary mapping helm keys to factomd binary arguments for mainnet | `{}`
`factomd._args.names.testnet` | dictionary mapping helm keys to factomd binary arguments for testnet | `customNet: customnet`
`factomd._config.defaults.global` | default global configuration | `apiPort: 8088 changeAcksHeight: 0 controlPanelPort: 8090 controlPanelSetting: readonly identityChainID: FA1E000000000000000000000000000000000000000000000000000000000000`
`factomd._config.defaults.mainnet` | default mainnet [congifuration](###configuration)
) | `p2pPort: 8108 specialPeers: "\"52.17.183.121:8108 52.17.153.126:8108 52.19.117.149:8108 52.18.72.212:8108\"" network: MAIN`
`factomd._config.defaults.testnet` | default testnet [congifuration](###configuration) | `bootstrapIdentity: 8888882f5002ff95fce15d20ecb7e18ae6cc4d5849b372985d856b56e492ae0f bootstrapKey: 58cfccaa48a101742845df3cecde6a9f38037030842d34d0eaa76867904705ae directoryBlockInSeconds: 600 exchangeRateAuthorityPublicKey: 58cfccaa48a101742845df3cecde6a9f38037030842d34d0eaa76867904705ae network: CUSTOM p2pPort: 8110 seedUrl: https://raw.githubusercontent.com/FactomProject/communitytestnet/master/seeds/testnetseeds.txt`
`factomd._configs.names.global` | dictionary mapping helm keys to factomd configuration keys | `apiPort: PortNumber changeAcksHeight: ChangeAcksHeight controlPanelPort: ControlPanelPort controlPanelSetting: ControlPanelSetting directoryBlockInSeconds: DirectoryBlockInSeconds exchangeRateAuthorityPublicKey: ExchangeRateAuthorityPublicKey identityChainID: IdentityChainID localServerPrivateKey: LocalServerPrivKey localServerPublicKey: LocalServerPublicKey network: Network`
`factomd._config_.names.mainnet` | dictionary mapping helm keys to factomd configuration keys for mainnet | `p2pPort: MainNetworkPort seedUrl: MainSeedURL specialPeers: MainSpecialPeers`
`factomd._config_.names.testnet` | dictionary mapping helm keys to factomd configuration keys for testnet | `bootstrapIdentity: CustomBootstrapIdentity bootstrapKey: CustomBootstrapKey p2pPort: CustomNetworkPort seedUrl: CustomSeedURL specialPeers: CustomSpecialPeers`
`prometheusToSD.container.resources.limits.cpu` | prometheusToSD pod cpu limit | `1000m`
`prometheusToSD.container.resources.limits.memory` | prometheusToSD pod memory limit | `4Gi`
`prometheusToSD.container.resources.requests.cpu` | prometheusToSD pod cpu request | `500m`
`prometheusToSD.container.resources.requests.memory` | factomd pod memory request | `2Gi`
`statefulSet.replicas` | desired number of factomd replicas | `1`

### arguments

Valid arguments passed to the factomd binary:
Argument | Description | Network
customNet | | testnet
faultTimeout | | global
startDelay | | global

global network means the argument is valid for both mainnet and testnet

### configuration

Valid configuration file keys:

Configuration | Description | Network
`apiPort` | port for api to listen on | `global`
`bootstrapIdentity (testnet only)` | | `testnet`
`bootstrapKey (testnet only)` | | `testnet`
`changeAcksHeight` | | `global`
`controlPanelPort` | port for control panel to listen on | `global`
`controlPanelPortSetting` | | `global`
`directoryBlockInSeconds` | | `global`
`exchangeRateAuthorityPublicKey` | | `global`
`identityChainID` | | `global`
`localServerPublicKey` | | `global`
`network` | | `global`
`p2pPort` | | `global`
`seedUrl` | | `global`
`specialPeers` | | `global`
