require("@nomicfoundation/hardhat-toolbox");

require("dotenv").config;

BSC_RPC='https://bsc-testnet-rpc.publicnode.com'
BSC_PRIV_KEY=""

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  defaultNetwork: "bsc",
  networks: {
    // "bsc_1": {
    //   url: process.env.BSC_RPC,
    //   accounts: [ process.env.BSC_PRIV_KEY ],
    // },
    "bsc": {
      url: BSC_RPC,
      accounts: [ BSC_PRIV_KEY ],
    },
  }
};
