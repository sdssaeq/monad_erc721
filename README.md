# Simple NFT Contract on Monad Testnet
## Note
- Dont Forget to change token name and symbol & your signer address / owner address on ignition/modules/Monaime.ts
## OR
- Create a file named <whatevername>.ts in the ignition/modules directory, with the following code:
```
import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const Modulename = buildModule("Modulename", (m) => {
    const gmonad = m.contract("YourContractName",["0x....."]); // your wallet addreess

    return { gmonad };
});

module.exports = Modulename;
```

# make sure you edit hardhat.config.ts same as this | hardhat.config.ts
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
```
git clone https://github.com/sdssaeq/monad_erc721.git
cd monad_erc721
npm install
npx hardhat vars set PRIVATE_KEY
npx hardhat ignition deploy ./ignition/modules/Monaime.ts --network monadTestnet
npx hardhat verify <contractAddress> --network monadTestnet
```
