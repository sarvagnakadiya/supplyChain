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


    function addSupplierProduct(bytes calldata _name,bytes calldata _description,bytes memory _unit,bytes memory _price,bytes memory _date,bytes memory _expiryDate)public {
        productsIdMappingToStructMapping[productCounter] = supplierProduct(msg.sender,_name,_description,_unit,_price,_date,_expiryDate);
        addressToproductsIdMapping[msg.sender].push(productCounter);
        productCounter++;
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

    function deleteProduct(uint _id)public {
        delete productsIdMappingToStructMapping[_id];
    }
}
