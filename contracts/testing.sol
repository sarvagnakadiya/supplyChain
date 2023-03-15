pragma solidity >=0.8.0 <=0.8.19;
contract test{
    struct userDetails{
        string[] names;
        string[] surnames;
    }

        userDetails u;
    function add(string[] memory _names,string[] memory _surnames) public{
        string[] memory name = _names;
        // bytes[] memory surname = _surnames;
        
        u = userDetails(_names,_surnames);
    }
function stringToBytes(string memory str) external pure returns (bytes memory) {
    bytes memory byteArray = bytes(str);
    return byteArray;
}}