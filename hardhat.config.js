require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

const FORK_FUJI = true;
const FORK_MAINNET = false;
let forkingData = undefined;
const PRIVATE_KEY="a51fd8ca19bfca640cd4a0a436a496416ba62ecb7e8725c785f7cd197a67a48f";

if (FORK_MAINNET) {
  forkingData = {
    url: "https://api.avax.network/ext/bc/C/rpcc",
  };
}
if (FORK_FUJI) {
  forkingData = {
    url: "https://api.avax-test.network/ext/bc/C/rpc",
  };
}

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    hardhat: {
      gasPrice: 225000000000,
      chainId: !forkingData ? 43112 : undefined, //Only specify a chainId if we are not forking
      forking: forkingData,
    },
    fuji: {
      url: "https://api.avax-test.network/ext/bc/C/rpc",
      gasPrice: 225000000000,
      chainId: 43113,
      accounts: [ `0x${PRIVATE_KEY}`], // we use a .env file to hide our wallets private key
    },
    mainnet: {
      url: "https://api.avax.network/ext/bc/C/rpc",
      gasPrice: 225000000000,
      chainId: 43114,
      accounts: [`0x${PRIVATE_KEY}`],
    },
  
  },
  etherscan: {
    apiKey:  {
      avalancheFujiTestnet:'8JXH6HS9VEKAI3QBSH4418URTX16CKIUHN',
    }
  }
 
};
