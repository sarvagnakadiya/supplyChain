// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/ISupplierManufacturer.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract supplierManufacturer is ISupplierManufacturer{
    uint public transferCounter = 1;
    uint[] alltransfers;

    //   bytes sp_id;
    //   address supplierAddress;
    //   address manufacturerAddress;
    //   bytes dispatchTime;
    //   bytes arrivalTime;

    mapping(uint => supplierManufacturer) public smidToStructMapping;
    function addData(bytes memory _sp_id, address _supplierAddress,address _manufacturerAddress,bytes memory _dispatchTime,bytes memory _arrivalTime)external override{
        smidToStructMapping[transferCounter] = supplierManufacturer(_sp_id,_supplierAddress,_manufacturerAddress,_dispatchTime,_arrivalTime);
        transferCounter++;
    } 
    function getData(uint _smid) public view returns(supplierManufacturer memory){
        return smidToStructMapping[_smid];
    }
}