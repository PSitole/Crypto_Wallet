# crypto_wallet

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Project Description

I implemented a basic crypto wallet using flutter with a crypto API service of my choice, with the provider state management approach. The Wallet is be able to send and receive ethereum-based tokens, add tokens and scan addresses using a qr code scanner.

# Project Funcionality

In the provided code, the WalletProvider class is responsible for interacting with the Ethereum blockchain through API calls.

The WalletProvider class manages the user's wallet address, token balances, and transactions. It utilizes the web3dart package to communicate with the Ethereum blockchain API, retrieve the wallet balance, and perform token transfers.

The API calls include fetching the user's wallet balance, retrieving token balances, sending token transactions, and verifying transaction status. These API calls are implemented within the WalletProvider class.


The QR Code Scanner class enables users to scan QR codes representing Ethereum addresses. This feature is used for receiving tokens and adding new tokens to the wallet.

The Wallet Screen class displays the user's Ethereum wallet balance and token balances. It provides options to send tokens to another address and receive tokens by displaying the user's wallet address.


By utilizing API services, the app can interact with the Ethereum blockchain and retrieve real-time data, ensuring that the displayed wallet balance, token balances, and transaction information are up-to-date and accurate.

In summary, the app connects to an actual wallet using APIs to interact with the Ethereum blockchain, fetch wallet and token balances, and perform token transfers.
