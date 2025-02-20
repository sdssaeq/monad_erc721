# Simple NFT Contract Address on Monad Testnet

# hardhat.config.ts
## make sure you edit hardhat.config.ts same as this
```
import type { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";
import { vars } from "hardhat/config";

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    monadTestnet: {
      url: "https://testnet-rpc.monad.xyz/", // Ensure this is set in your .env file
      accounts: [vars.get("PRIVATE_KEY")], // Ensure PRIVATE_KEY is defined
      chainId: 10143,
    },
  },
  sourcify: {
    enabled: true,
    apiUrl: "https://sourcify-api-monad.blockvision.org",
    browserUrl: "https://testnet.monadexplorer.com/",
  },
  etherscan: {
    enabled: false,
  },
};

export default config;
```
# Commands
-npx hardhat vars set PRIVATE_KEY
-npx hardhat ignition deploy ./ignition/modules/Monaime.ts --network monadTestnet
-npx hardhat verify <contractAddress> --network monadTestnet