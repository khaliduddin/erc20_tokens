// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

// npx hardhat ignition deploy ./ignition/modules/Lock.js --network localhost

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("DummyUsdcModule", (m) => {
  const usdc = m.contract("DummyUsdc");

  return { usdc };
});
// DummyUsdc - 0x91653dce049bD558dFcE448244a5820DA15Ecc5d