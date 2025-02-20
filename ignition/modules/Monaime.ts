import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MonaimeNFT = buildModule("MonaimeNFT", (m) => {
    const monaime = m.contract("MonaimeNFT",["0x8d83228d29459b25f5449d7794cf0b1814c06d8d"]);

    return { monaime };
});

module.exports = MonaimeNFT;