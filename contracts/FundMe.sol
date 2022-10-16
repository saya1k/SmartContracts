//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import"./PriceConverter.sol";
contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;
    address[] public funders;
    mapping(adress => uint256) public addressToAmountFunded;
    address public immutable i_owner;

    //constructor: called immediately upon deployment
    constructor(){
        i_owner = msg.sender;
    }
   
    function fund() public payable { 
        //require(getConversionRate(msg.value) >= 1e18, "Did not meet minimum"); // 1 ether = 1 * 10 ** 18 Wei
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send minimum!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }
    //fund withdraw -- only deployer
    function withdraw() public onlyOwner {
        //loop to update funders to represent withdrawals -start, end, increment-
        for(uint256 funderIndex=0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] =0;
        }
        //update address array
        funders = new address[](0);
        //call
        (bool callSuccess,) = payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess, "Call Failed");
    }
    modifier onlyOwner {
        require(msg.sender == i_owner, 'Not owner');
        _;
    }
}