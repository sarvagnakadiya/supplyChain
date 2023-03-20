// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/IDistributorProduct.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract distributorProduct is IDistributorProduct{
    uint dpId = 1;
    uint[] allProducts;
    mapping(uint => distributorProduct) public productsIdMappingToStructMapping;
    mapping(address => uint[]) public addressToproductsIdMapping;

    //   address[] manufacturerAddress;
    //   uint[] mdId;    
    //   bytes dp_name;
    //   bytes dp_description;
    //   uint128 dp_unit;
    //   uint128 dp_price;
    //   uint32 dp_date;
    //   uint32 dp_expiryDate;

    function addDistributorProduct(address[] memory _manufacturerAddress,uint[] memory _mdId, bytes calldata _name,bytes calldata _description,uint128 _unit,uint128 _price,uint32 _date,uint32 _expiryDate)public override {
        productsIdMappingToStructMapping[dpId] = distributorProduct(_manufacturerAddress,_mdId,_name,_description,_unit,_price,_date,_expiryDate);
        addressToproductsIdMapping[msg.sender].push(dpId);
        emit eventAddDistributorProduct(dpId,_manufacturerAddress,_mdId,_name,_description,_unit,_price,_date,_expiryDate);
        dpId++;
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
        emit eventDeleteDistributorProduct(_id);
    }
}