async function main() {
  const [deployer] = await ethers.getSigners();
  const instance = await ethers.deployContract('Token');
  console.log('deployer', deployer.address, 'contractinstance', await instance.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(e => {
    console.log('error', e);
    process.exit(1);
  });
