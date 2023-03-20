// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/ISupplierProduct.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract supplierProduct is ISupplierProduct{
    uint spId = 1;
    uint[] allProducts;
    mapping(uint => supplierProduct) public productsIdMappingToStructMapping;
    mapping(address => uint[]) public addressToproductsIdMapping;

    // struct
    //   address supplierAddress;
    //   bytes sp_name;
    //   bytes sp_description;
    //   uint sp_unit;
    //   uint sp_price;
    //   uint32 sp_date;
    //   uint32 sp_expiryDate;
    

    function addSupplierProduct(bytes calldata _name,bytes calldata _description,uint128 _unit,uint128 _price,uint32 _date,uint32 _expiryDate)public override  {
        productsIdMappingToStructMapping[spId] = supplierProduct(msg.sender,_name,_description,_unit,_price,_date,_expiryDate);
        addressToproductsIdMapping[msg.sender].push(spId);
        emit eventAddSupplierProduct(spId,msg.sender,_name,_description,_unit,_price,_date,_expiryDate,block.timestamp);
        spId++;
    }

    function getSupplierProductIds() public view returns(uint[] memory){
        return addressToproductsIdMapping[msg.sender];
    }

    function getSingleProduct(uint _id) public view returns(supplierProduct memory){
        return productsIdMappingToStructMapping[_id];
    }

    function getAllProductsOfSupplier(address _supplierAddress) public view returns(supplierProduct[] memory)
    {
        uint[] memory productIds= addressToproductsIdMapping[_supplierAddress];
        supplierProduct[] memory supplierP = new supplierProduct[](productIds.length);
        for(uint i=0;i<productIds.length;i++)
        {
                supplierP[i] =productsIdMappingToStructMapping[productIds[i]];
        }
        return supplierP;
    }

    function deleteProduct(uint _id)public override {
        delete productsIdMappingToStructMapping[_id];
        emit eventDeleteSupplierProduct(_id);
    }
}