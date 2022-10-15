//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//inheritance: from SimpleStorage.sol
import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    //overriding: keywords are "override" & "virtual/override"
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber +5;
    }
}