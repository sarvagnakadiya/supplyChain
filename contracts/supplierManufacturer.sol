// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/ISupplierManufacturer.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract supplierManufacturer is ISupplierManufacturer{
    uint public smId = 1;
    uint[] allSmId;

    //   uint sp_id;
    //   address supplierAddress;
    //   address manufacturerAddress;
    //   uint32 dispatchTime;
    //   uint32 arrivalTime;

    mapping(uint => supplierManufacturer) public smidToStructMapping;
    mapping(address => uint[]) public manufacturerTosmIDMapping;
    function transferProduct(uint _spId, address _supplierAddress,address _manufacturerAddress,uint32 _dispatchTime,uint32 _arrivalTime)external override{
        smidToStructMapping[smId] = supplierManufacturer(_spId,_supplierAddress,_manufacturerAddress,_dispatchTime,_arrivalTime);
        allSmId.push(smId);
        manufacturerTosmIDMapping[_manufacturerAddress].push(smId);
        emit eventSupplierManufacturerTransfer(smId,_spId,_supplierAddress,_manufacturerAddress,_dispatchTime);
        smId++;
    } 

    function receiveProduct(uint _smId)external override{
        smidToStructMapping[_smId].arrivalTime = uint32(block.timestamp);
        emit eventArrivalTime(uint32(block.timestamp));
    } 
    function getProduct(uint _smId) public view returns(supplierManufacturer memory){
        return smidToStructMapping[_smId];
    }

    function getAllSmIdForManufacturer(address _manufacturerAddress) public view returns(supplierManufacturer[] memory){
        
        uint[] memory smIdData = manufacturerTosmIDMapping[_manufacturerAddress];
        supplierManufacturer[] memory smIdDetails = new supplierManufacturer[](smIdData.length);
        for(uint i=0;i<smIdData.length;i++)
        {
            smIdDetails[i] = smidToStructMapping[smIdData[i]];
        }
        return smIdDetails;
    }
}