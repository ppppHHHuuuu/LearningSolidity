// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

pragma solidity ^0.8.20;
contract WETHMarket {
    IERC20 public weth;
    mapping (address => uint256) public balanceOf;

    constructor(IERC20 _weth) {
        weth = _weth;
    }

    function buyFrom(address seller) external payable {
        balanceOf[seller] += msg.value;
        require(weth.transferFrom(seller, msg.sender, msg.value), "WETH transfer failed.");
    }

    function withdraw(uint256 amount) external  {
        require(amount <= balanceOf[msg.sender], "Insufficient withdraw");
        balanceOf[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value:amount}("");
        require(success, "ETH transfer failed."); 
    }
}