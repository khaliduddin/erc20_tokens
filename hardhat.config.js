require("@nomicfoundation/hardhat-toolbox");

require("dotenv").config;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  defaultNetwork: "bsc",
  networks: {
    "bsc": {
      url: process.env.BSC_RPC,
      accounts: [ process.env.BSC_PRIV_KEY ],
    },
  }
};
