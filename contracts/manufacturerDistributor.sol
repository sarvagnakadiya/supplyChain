// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/IManufacturerDistributor.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract manufacturerDistributor is IManufacturerDistributor{
    uint public transferCounter = 1;
    uint[] alltransfers;

    //   bytes sp_id;
    //   address supplierAddress;
    //   address manufacturerAddress;
    //   bytes dispatchTime;
    //   bytes arrivalTime;

    mapping(uint => manufacturerDistributor) public mdidToStructMapping;
    function addData(bytes memory _mp_id, address _manufacturerAddress,address _distributorAddress,bytes memory _dispatchTime,bytes memory _arrivalTime)external override{
        mdidToStructMapping[transferCounter] = manufacturerDistributor(_mp_id,_manufacturerAddress,_distributorAddress,_dispatchTime,_arrivalTime);
        transferCounter++;
    } 
    function getData(uint _mdid) public view returns(manufacturerDistributor memory){
        return mdidToStructMapping[_mdid];
    }
}