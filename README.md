# Degen Gaming Token (DGN) - ERC20 Contract


## Overview

Degen Gaming Token (DGN) is a unique token designed for Degen Gaming Studio on the Avalanche blockchain. It serves as a reward system for players within the gaming ecosystem, allowing them to earn tokens while playing and enhancing their gaming experience. Players can redeem tokens for various in-game items, transfer tokens to other players, and burn tokens as needed.

## Contract Details

- **Name**: DegenToken

- **Symbol**: DGN

- **Decimals**: 0 (fixed)

## Features

1\. **Redeem Tokens**: Players can redeem their DGN tokens for in-game items available on the Degen Mart website.

2\. **Transfer Tokens**: Users can transfer DGN tokens to other accounts.

3\. **Burn Tokens**: Tokens can be burned by the token holders, reducing the total supply.

4\. **Mint Tokens**: The contract owner can mint new tokens and assign them to specified addresses.

5\. **Pausing Mechanism**: The contract includes a pausing mechanism that allows the owner to pause and unpause token transfers.



## Token Functionality

The DegenToken contract implements the following functions:

1\. `totalSupply()`: Returns the total supply of DegenTokens.

2\. `balanceOf(address account)`: Returns the token balance of the specified account.

3\. `transfer(address recipient, uint256 amount)`: Transfers tokens from the sender's account to the specified recipient.

4\. `burn(uint256 amount)`: Burns tokens from the sender's account, reducing the total supply.

5\. `mint(address to, uint256 amount)`: Mints new tokens and assigns them to the specified recipient. Only the contract owner can perform this operation.

6\. `redeem(uint256 index)`: Allows the sender to redeem tokens for an item in the in-game store.

7\. `pause()`: Pauses all token transfers. Only the contract owner can pause the contract.

8\. `unpause()`: Unpauses token transfers. Only the contract owner can unpause the contract.

9\. `getOwnedItems(address account)`: Retrieves the list of items owned by the specified account.

10\. `getAvailableItems()`: Returns the list of available in-game items.

## Local Installation

To interact with the DegenToken contract and Degen Mart website on the Avalanche network, follow these steps:

1\. Install the required dependencies: Hardhat .

2\. Clone the repository: `git clone https://github.com/your-username/your-repo.git`

3\. Navigate to the project directory: `cd your-repo`

4\. Install the project dependencies: `npm install`

5\. Set up your Avalanche network provider and account credentials in the Hardhat configuration file (`hardhat.config.js`).

6\. Deploy the contract to the Avalanche network using Hardhat: `npx hardhat run scripts/deploy.js --network fuji` (Make sure to provide your private key inside `hardhat.config.js`).

For detailed installation and deployment guide, refer to your repository's documentation.


Contract Deployment
-------------------

The DegenToken contract has been deployed on the Avalanche blockchain using Snowtrace.

Contract Deployment Link: [Snowtrace - DegenToken](https://testnet.snowtrace.io/address/0x077151E16BcAb6e3be0157ef275b251BcD2F9aB9)

## Acknowledgements

This project was developed with the guidance and support of Metacrafters as part of their comprehensive web3 avax course.

## License

This project is licensed under the MIT License.