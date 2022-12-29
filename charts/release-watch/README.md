# release-watch

![Version: 0.1.4](https://img.shields.io/badge/Version-0.1.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: main](https://img.shields.io/badge/AppVersion-main-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| pokt-foundation |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalManifests | list | `[]` |  |
| env[0].name | string | `"DISCORD_TOKEN"` |  |
| env[0].value | string | `"foo"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"pocketfoundation/release-watch"` |  |
| image.tag | string | `"sha-dff508c"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| repos | string | `"algorand:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/algorand/go-algorand\narweave:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: false\n  repo: https://github.com/ArweaveTeam/arweave\navalanche:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/ava-labs/avalanchego\navalanche-subnets:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/ava-labs/subnet-evm\nbinance:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/binance-exchange/binance-api-node\nbitcoin:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: false\n  repo: https://github.com/bitcoin/bitcoin\nboba:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: false\n  repo: https://github.com/bobanetwork/boba\ndogechain:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/dogechain-lab/dogechain\nethereum:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/ethereum/go-ethereum\nerigon:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/ledgerwatch/erigon\nevmos:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/tharsis/evmos\nfantom:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/Fantom-foundation/go-opera\nfuse:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/fuseio/fuse-network\nharmony:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/harmony-one/harmony\niotex:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/iotexproject/iotex-core\nklaytn:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/klaytn/klaytn\nmoonbeam:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/PureStake/moonbeam\nmoonriver:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/PureStake/moonbeam\nnear:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/near/nearcore\nokex:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/okex/exchain\noptimism:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/ethereum-optimism/optimism\nosmosis:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/osmosis-labs/osmosis\npocket:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/pokt-network/pocket-core/releases\npolygon:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/maticnetwork/bor\nsolana:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/solana-labs/solana\nstarknet:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/eqlabs/pathfinder\ntest:\n  channels:\n    - \"931305730080915526\"\n    - \"1008823719273177178\"\n  critical: true\n  repo: https://github.com/pokt-foundation/node-watch-test\n"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"release-watch"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
