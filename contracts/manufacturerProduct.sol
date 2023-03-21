// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/IManufacturerProduct.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract manufacturerProduct is IManufacturerProduct{
    uint mpId = 1;
    mapping(uint => manufacturerProduct) public manufacturerProductsIdToStructMapping;
    mapping(address => uint[]) public manufacturerAddressToproductsIdMapping;

    //   address[] supplierAddress;
    //   uint[] smId;    
    //   bytes mp_name;
    //   bytes mp_description;
    //   uint128 mp_unit;
    //   uint128 mp_price;
    //   uint32 mp_date;
    //   uint32 mp_expiryDate;

    function addManufacturerProduct(address[] memory _supplierAddress,uint[] memory _smId,bytes calldata _name,bytes calldata _description,uint128 _unit,uint128 _price,uint32 _date,uint32 _expiryDate)public override {
        manufacturerProductsIdToStructMapping[mpId] = manufacturerProduct(_supplierAddress,_smId,_name,_description,_unit,_price,_date,_expiryDate);
        manufacturerAddressToproductsIdMapping[msg.sender].push(mpId);
        emit eventAddManufacturerProduct(mpId,_supplierAddress,_smId,_name,_description,_unit,_price,_date,_expiryDate);
        mpId++;
    }

    function updateDistributorProductUints(uint _mpId, uint128 _quantity) public override{
        manufacturerProductsIdToStructMapping[_mpId].mp_unit -= _quantity;  
        emit eventUpdateDistributorProductUints(_mpId, manufacturerProductsIdToStructMapping[_mpId].mp_unit);
    }

    function getManufacturerProductIds() public view returns(uint[] memory){
        return manufacturerAddressToproductsIdMapping[msg.sender];
    }

    function getSingleManufacturerProduct(uint _id) public view returns(manufacturerProduct memory){
        return manufacturerProductsIdToStructMapping[_id];
    }

     function getAllProductsOfManufacturer(address _manufacturerAddress) public view returns(manufacturerProduct[] memory)
    {
        uint[] memory productIds= manufacturerAddressToproductsIdMapping[_manufacturerAddress];
        manufacturerProduct[] memory ManufacturerP = new manufacturerProduct[](productIds.length);
        for(uint i=0;i<productIds.length;i++)
        {
                ManufacturerP[i] =manufacturerProductsIdToStructMapping[productIds[i]];
        }
        return ManufacturerP;
    }

    function deleteManufacturerProduct(uint _id)external override{
        delete manufacturerProductsIdToStructMapping[_id];
        emit eventDeleteManufacturerProduct(_id);
    }
}