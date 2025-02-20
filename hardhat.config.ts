import type { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";
import { vars } from "hardhat/config";

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    monadTestnet: {
      url: "https://testnet-rpc.monad.xyz/",
      accounts: [vars.get("PRIVATE_KEY")],
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
