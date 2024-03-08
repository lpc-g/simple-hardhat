/** @type import('hardhat/config').HardhatUserConfig */
require('@nomicfoundation/hardhat-toolbox');
require('dotenv').config();
const { API_KEY, PRIVATE_KEY } = process.env;
module.exports = {
  solidity: '0.8.24',
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/${API_KEY}`,
      accounts: [PRIVATE_KEY],
    },
  },
};
