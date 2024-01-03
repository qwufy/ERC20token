// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/token/ERC20/ERC20.sol";

contract CustomToken is ERC20 {
    address public owner;

    constructor() ERC20("<AITU_Sayat>", "UNF") {
        owner = msg.sender;
        _mint(msg.sender, 2000 * (10**decimals()));
    }

    // Function to return the block timestamp of the latest transaction in a human-readable format
    function getLatestTransactionTimestamp() public view returns (string memory) {
        return timestampToString(block.timestamp);
    }

    // Function to retrieve the address of the transaction sender
    function getTransactionSender() public view returns (address) {
        return msg.sender;
    }

    // Function to retrieve the address of the transaction receiver
    function getTransactionReceiver() public view returns (address) {
        return address(this);
    }

    // Helper function to convert timestamp to a human-readable format
    function timestampToString(uint256 timestamp) internal pure returns (string memory) {
        return bytes32ToString(bytes32(timestamp));
    }

    // Helper function to convert bytes32 to a string
    function bytes32ToString(bytes32 data) internal pure returns (string memory) {
        bytes memory bytesData = new bytes(32);
        for (uint256 i = 0; i < 32; i++) {
            bytesData[i] = data[i];
        }
        return string(bytesData);
    }
}
