// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/ISupplierManufacturer.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract supplierManufacturer is ISupplierManufacturer{
    uint public smId = 1;
    uint[] allSmId;

    //   bytes sp_id;
    //   address supplierAddress;
    //   address manufacturerAddress;
    //   bytes dispatchTime;
    //   bytes arrivalTime;

    mapping(uint => supplierManufacturer) public smidToStructMapping;
    mapping(address => uint[]) public manufacturerTosmIDMapping;
    function transferProduct(bytes memory _sp_id, address _supplierAddress,address _manufacturerAddress,bytes memory _dispatchTime,bytes memory _arrivalTime)external override{
        smidToStructMapping[smId] = supplierManufacturer(_sp_id,_supplierAddress,_manufacturerAddress,_dispatchTime,_arrivalTime);
        allSmId.push(smId);
        manufacturerTosmIDMapping[_manufacturerAddress].push(smId);
        smId++;
    } 

    function receiveProduct(uint _smId, bytes memory _arrivalTime)external override{
        smidToStructMapping[_smId].arrivalTime = _arrivalTime;
        
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