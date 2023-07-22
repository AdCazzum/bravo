import { ethers } from "hardhat";

async function main() {
  const bravoLib = await hre.ethers.deployContract("Bravo", {});

  const libDeployment = await bravoLib.waitForDeployment();

  console.log(libDeployment);
  console.log("Bravo library deployed");

  const contractDeployment = await ethers.deployContract("Logic", [], {
    libraries: {
      Bravo: libDeployment.target
    }
  });

  console.log(await contractDeployment.waitForDeployment());

  console.log("Contract deployed");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
