# Simple DeFi Yield Vault (ERC-4626)

This repository provides a clean, production-ready implementation of an ERC-4626 compliant vault. ERC-4626 is the gold standard for yield-bearing tokens, providing a unified API for depositing assets and receiving "shares" in a vault.

## Why ERC-4626?
Before this standard, every yield aggregator (Yearn, Beefy, etc.) had different function names for depositing and withdrawing. ERC-4626 standardizes this, making your vault immediately compatible with various DeFi front-ends and other protocols.

## Features
- **Tokenized Shares:** Automatic calculation of share prices based on underlying assets.
- **Yield Ready:** Designed to be easily extended with a strategy contract to earn interest.
- **Strict Compliance:** Fully follows the EIP-4626 specification for maximum interoperability.



## Tech Stack
- **Solidity ^0.8.20**
- **OpenZeppelin ERC4626**
- **Foundry**
