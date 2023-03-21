// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/IManufacturerDistributor.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract manufacturerDistributor is IManufacturerDistributor{
    uint public mdId = 1;
    uint[] alltransfers;

    //   uint _mpId;
    //   address _manufacturerAddress;
    //   address _distributorAddress;
    //   bytes dispatchTime;
    //   bytes arrivalTime;

    event eventManufacturerDistributorTransfer(uint indexed _mdId,uint indexed _mpId, address _manufacturerAddress,address _distributorAddress,uint32 _dispatchTime);
    event eventArrivalTime(uint32 _arrivalTime);

    mapping(uint => manufacturerDistributor) public mdidToStructMapping;
    mapping(address => uint[]) public distributorTosmIDMapping;

    function transferproduct(uint _mpId, address _manufacturerAddress,address _distributorAddress,uint32 _dispatchTime,uint32 _arrivalTime)external override{
        mdidToStructMapping[mdId] = manufacturerDistributor(_mpId,_manufacturerAddress,_distributorAddress,_dispatchTime,_arrivalTime);
        distributorTosmIDMapping[_distributorAddress].push(mdId);
        emit eventManufacturerDistributorTransfer(mdId,_mpId,_manufacturerAddress,_distributorAddress,_dispatchTime);
        mdId++;
    } 

    function receiveProduct(uint _mdId)external override{
        mdidToStructMapping[_mdId].arrivalTime = uint32(block.timestamp);
        emit eventArrivalTime(uint32(block.timestamp));
        
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