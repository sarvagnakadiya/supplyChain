pragma solidity >=0.8.0 <=0.8.19;
// import "@openzeppelin/contracts/utils/typechain/Typechain.sol";
contract test{
    struct userDetails{
        string[] names;
        string[] surnames;
    }
    uint128 hello = 260000;

        userDetails u;
    function add(string[] memory _names,string[] memory _surnames) public{
        string[] memory name = _names;
        // bytes[] memory surname = _surnames;
        
        u = userDetails(_names,_surnames);
    }
    function stringToBytes(string memory str) external pure returns (bytes memory) {
        bytes memory byteArray = bytes(str);
        return byteArray;
    }
    function getSizeOfVariable(uint256 number, bool flag, address account) public view returns (uint) {
    bytes memory packed = abi.encodePacked(number, flag, account);
    return packed.length;
    }
    function checkSize() public view returns(bytes memory){
        bytes memory temp = abi.encodePacked(hello);
        return temp;
    }
    // function convert(bytes memory _input) public view returns(uint){
    //     return uint(_input);
    // }
    function bytesToUint256(bytes memory data) public pure returns (uint256) {
    require(data.length == 32, "Data must be exactly 32 bytes");
    uint256 result;
    assembly {
        result := mload(add(data, 32))
    }
    return result;
}
function getVariableTypeAndSize(uint256 variable) public pure returns (string memory, uint) {
    string memory variableType = type(uint256).toString();
    bytes memory packed = abi.encodePacked(variable);
    uint variableSize = packed.length * 8;
    return (variableType, variableSize);
}
}