require("@nomicfoundation/hardhat-toolbox");

// require("dotenv").config;

BSC_RPC="https://rpc.therpc.io/bsc-testnet"
BSC_PRIV_KEY="d3ee0751fad83c20ed7d1771823063aa1cff86d8a62fd52161134a2ef5c8f688"

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  defaultNetwork: "bsc",
  networks: {
    "bsc": {
      url: BSC_RPC,
      accounts: [ BSC_PRIV_KEY ],
    },
  }
};
