// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function main() {
  const whiteListContract  = await hre.ethers.deployContract("WhiteList_dapp", [10]);
  await whiteListContract.waitForDeployment();
  await sleep(30*1000);
  
  await hre.run("verify:verify", {
    address: whiteListContract.target,
    constructorArguments: [10],
  });

} 

main()
  .then(() => process.exit(0))
  .catch (error => {
      console.error(error);
      process.exit(1);
  });