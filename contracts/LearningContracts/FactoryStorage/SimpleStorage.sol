// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    mapping (string => uint256) public userToFavNumber;

    uint256 favNumber;
    struct People {
        string name;
        uint256 favNumber;
    }
    People[] public people;
    function store(uint256 _favNumber) public virtual {
        favNumber = _favNumber;
    }

    function retrieve() public view returns(uint256) {
        return favNumber;
    }

    function addPerson(string calldata _name, uint256 _favNumber) public {
        People memory newPerson = People({name: _name, favNumber: _favNumber});
        people.push(newPerson);
        userToFavNumber[_name] = _favNumber;
    }
}