// Import the Hardhat package
const hre = require("hardhat");

async function main() {
    
  const nftContract = hre.ethers.deployContract("Digital_assets");
  (await nftContract).waitForDeployment();
  console.log("Contact address", (await nftContract).target);
}

// Call the main function and catch if there is any error
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });