// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/ISupplierProduct.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract supplierProduct is ISupplierProduct{
    uint productCounter = 1;
    uint[] allProducts;
    mapping(uint => supplierProduct) public productsIdMappingToStructMapping;
    mapping(address => uint[]) public addressToproductsIdMapping;

    //   address supplierAddress;
    //   bytes sp_name;
    //   bytes sp_description;
    //   bytes sp_unit;
    //   bytes sp_price;
    //   bytes sp_date;
    //   bytes sp_expiryDate;


    function addSupplierProduct(bytes calldata _name,bytes calldata _description,bytes memory _unit,bytes memory _price,bytes memory _date,bytes memory _expiryDate)public override {
        productsIdMappingToStructMapping[productCounter] = supplierProduct(msg.sender,_name,_description,_unit,_price,_date,_expiryDate);
        addressToproductsIdMapping[msg.sender].push(productCounter);
        productCounter++;
    }

    function getSupplierProducts() public view returns(uint[] memory){
        return addressToproductsIdMapping[msg.sender];
    }

    function getProduct(uint _id) public view returns(supplierProduct memory){
        return productsIdMappingToStructMapping[_id];
    }

    function deleteProduct(uint _id)external override{
        delete productsIdMappingToStructMapping[_id];
    }
}
