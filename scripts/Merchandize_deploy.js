const hre = require("hardhat");
require("dotenv").config()

async function main() {
  const NFTMarketplace= await hre.ethers.getContractFactory("Merchandize_NFTMarketplace")
  console.log("Deploying contract...")
  const Merchandize= await NFTMarketplace.deploy(1)
  await Merchandize.deployed()
  console.log(`RapBattleVotingContract deployed at ${Merchandize.address}`)

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});