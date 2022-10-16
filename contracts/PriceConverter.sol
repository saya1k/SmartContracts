//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library PriceConverter {
    function getPrice() public view returns (uint256) {
        //need ABI -from ETH data feed- and address of the contract
        //Need Address for Goerli(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e) and Mainnet
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,,)= priceFeed.latestRoundData(); //Eth in terms of USD ex. 3000.00000000 
        return uint256(price*1e10);
    }
    function getVersion() public view returns(uint256) {
        //interfaces github.com/smartcontractkit/chainlink/contracts
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();  
    }
    function getConversionRate(uint256 ethAmount) public view return (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) /1e18;
        return ethAmountInUsd;
    }
}