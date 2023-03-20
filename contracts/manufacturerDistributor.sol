// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/IManufacturerDistributor.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract manufacturerDistributor is IManufacturerDistributor{
    uint public mdId = 1;
    uint[] alltransfers;

    //   bytes _mp_id;
    //   address _manufacturerAddress;
    //   address _distributorAddress;
    //   bytes dispatchTime;
    //   bytes arrivalTime;

    mapping(uint => manufacturerDistributor) public mdidToStructMapping;
    mapping(address => uint[]) public distributorTosmIDMapping;

    function transferproduct(bytes memory _mp_id, address _manufacturerAddress,address _distributorAddress,uint32 _dispatchTime,uint32 _arrivalTime)external override{
        mdidToStructMapping[mdId] = manufacturerDistributor(_mp_id,_manufacturerAddress,_distributorAddress,_dispatchTime,_arrivalTime);
        distributorTosmIDMapping[_distributorAddress].push(mdId);
        mdId++;
    } 

    function receiveProduct(uint _mdId, uint32 _arrivalTime)external override{
        mdidToStructMapping[_mdId].arrivalTime = _arrivalTime;
        
    } 
    function getProduct(uint _mdid) public view returns(manufacturerDistributor memory){
        return mdidToStructMapping[_mdid];
    }

      function getAllmdIdForManufacturer(address _distributorAddress) public view returns(manufacturerDistributor[] memory){
        
        uint[] memory mdIdData = distributorTosmIDMapping[_distributorAddress];
        manufacturerDistributor[] memory mdIdDetails = new manufacturerDistributor[](mdIdData.length);
        for(uint i=0;i<mdIdData.length;i++)
        {
            mdIdDetails[i] = mdidToStructMapping[mdIdData[i]];
        }
        return mdIdDetails;
    }
}