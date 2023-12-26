// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LocalArrayVariableTest {
    uint256[] data;
    function sfStore() public {
        uint256[] storage x = data;
        x.push(2);
    }

}