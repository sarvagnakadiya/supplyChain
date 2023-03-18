// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/IDistributorProduct.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract distributorProduct is IDistributorProduct{
    uint productCounter = 1;
    uint[] allProducts;
    mapping(uint => distributorProduct) public productsIdMappingToStructMapping;
    mapping(address => uint[]) public addressToproductsIdMapping;

    //   address[] manufacturerAddress;
    //   bytes[] md_id;    
    //   bytes dp_name;
    //   bytes dp_description;
    //   bytes dp_unit;
    //   bytes dp_price;
    //   bytes dp_date;
    //   bytes dp_expiryDate;

    function addDistributorProduct(address[] memory _manufacturerAddress,bytes[] memory _md_id, bytes calldata _name,bytes calldata _description,bytes memory _unit,bytes memory _price,bytes memory _date,bytes memory _expiryDate)public override {
        productsIdMappingToStructMapping[productCounter] = distributorProduct(_manufacturerAddress,_md_id,_name,_description,_unit,_price,_date,_expiryDate);
        addressToproductsIdMapping[msg.sender].push(productCounter);
        productCounter++;
    }

    function getDistributorProductIds() public view returns(uint[] memory){
        return addressToproductsIdMapping[msg.sender];
    }

    function getSingleProduct(uint _id) public view returns(distributorProduct memory){
        return productsIdMappingToStructMapping[_id];
    }

    function getAllProductsOfDistributor(address _distributorAddress) public view returns(distributorProduct[] memory)
    {
        uint[] memory productIds= addressToproductsIdMapping[_distributorAddress];
        distributorProduct[] memory DistributorP = new distributorProduct[](productIds.length);
        for(uint i=0;i<productIds.length;i++)
        {
                DistributorP[i] =productsIdMappingToStructMapping[productIds[i]];
        }
        return DistributorP;
    }

    function deleteProduct(uint _id)external override{
        delete productsIdMappingToStructMapping[_id];
    }
}