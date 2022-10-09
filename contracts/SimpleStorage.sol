//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    //variable types: bool, uint, int, address, bytes, string
    uint256 favoriteNumber;
    //mapping
    mapping(string => uint256) public NameToFavoriteNumber;
    // struct
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    //array
    People[] public people;
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    //view: reads state without spending gas unless called within another function (does not modify state)
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    //add people to the array
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        NameToFavoriteNumber[_name] = _favoriteNumber;
    }
}