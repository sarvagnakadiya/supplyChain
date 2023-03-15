// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/IManufacturerProduct.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract manufacturerProduct is IManufacturerProduct{
    uint productCounter = 1;
    uint[] allProducts;
    mapping(uint => manufacturerProduct) public productsIdMappingToStructMapping;
    mapping(address => uint[]) public addressToproductsIdMapping;

    //   bytes[] supplierAddress;
    //   bytes[] sm_id;    
    //   bytes mp_name;
    //   bytes mp_description;
    //   bytes mp_unit;
    //   bytes mp_price;
    //   bytes mp_date;
    //   bytes mp_expiryDate;

    function addManufacturerProduct(address[] memory _supplierAddress,bytes[] memory _sm_id,bytes calldata _name,bytes calldata _description,bytes memory _unit,bytes memory _price,bytes memory _date,bytes memory _expiryDate)public override {
        productsIdMappingToStructMapping[productCounter] = manufacturerProduct(_supplierAddress,_sm_id,_name,_description,_unit,_price,_date,_expiryDate);
        addressToproductsIdMapping[msg.sender].push(productCounter);
        productCounter++;
    }

    function getManufacturerProducts() public view returns(uint[] memory){
        return addressToproductsIdMapping[msg.sender];
    }

    function getProduct(uint _id) public view returns(manufacturerProduct memory){
        return productsIdMappingToStructMapping[_id];
    }

    function deleteProduct(uint _id)external override{
        delete productsIdMappingToStructMapping[_id];
    }
}