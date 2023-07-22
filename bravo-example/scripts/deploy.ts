import { ethers } from "hardhat";

async function main() {
  const lock = await ethers.deployContract("Logic", [], {});

  console.log(await lock.waitForDeployment());

  console.log("Deployed");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
