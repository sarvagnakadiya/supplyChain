//SPDX-License-Identifier: MIT
pragma solidity^0.8.0;
contract Provylens{
    string hash;
    struct details{
        string name;
        uint expiryDate;
    }
    mapping(string => details) public hashToDetailsMapping;
    mapping(uint=>uint)public faltuMapping;
    mapping(string => string) public hashChainMapping;

    function addDetails(string memory _hash) public{
        hashToDetailsMapping[_hash] = details("abc", 123);
    }
    
    

}