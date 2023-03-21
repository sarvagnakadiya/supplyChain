// SPDX-License-Identifier: GPL-3.0
import "./Interfaces/ISupplierProduct.sol";
pragma solidity >=0.8.0 <=0.8.19;
contract supplierProduct is ISupplierProduct{
    uint spId = 1;
    mapping(uint => supplierProduct) public supplierProductsIdToStructMapping;
    mapping(address => uint[]) public supplierAddressToproductsIdMapping;

    // struct
    //   address supplierAddress;
    //   bytes sp_name;
    //   bytes sp_description;
    //   uint sp_unit;
    //   uint sp_price;
    //   uint32 sp_date;
    //   uint32 sp_expiryDate;
    
    function addSupplierProduct(bytes calldata _name,bytes calldata _description,uint128 _unit,uint128 _price,uint32 _date,uint32 _expiryDate)public override  {
        supplierProductsIdToStructMapping[spId] = supplierProduct(msg.sender,_name,_description,_unit,_price,_date,_expiryDate);
        supplierAddressToproductsIdMapping[msg.sender].push(spId);
        emit eventAddSupplierProduct(spId,msg.sender,_name,_description,_unit,_price,_date,_expiryDate,block.timestamp);
        spId++;
    }

    function updateSupplierProductUints(uint _spId, uint128 _quantity) public override{
        supplierProductsIdToStructMapping[_spId].sp_unit -= _quantity;  
        emit eventUpdateSupplierProductUints(_spId, supplierProductsIdToStructMapping[_spId].sp_unit);
    }

    function getSupplierProductIds() public view returns(uint[] memory){
        return supplierAddressToproductsIdMapping[msg.sender];
    }

    function getSingleProduct(uint _id) public view returns(supplierProduct memory){
        return supplierProductsIdToStructMapping[_id];
    }

    function getAllProductsOfSupplier(address _supplierAddress) public view returns(supplierProduct[] memory)
    {
        uint[] memory productIds= supplierAddressToproductsIdMapping[_supplierAddress];
        supplierProduct[] memory supplierP = new supplierProduct[](productIds.length);
        for(uint i=0;i<productIds.length;i++)
        {
                supplierP[i] =supplierProductsIdToStructMapping[productIds[i]];
        }
        return supplierP;
    }

    function deleteSupplierProduct(uint _id)public override {
        delete supplierProductsIdToStructMapping[_id];
        emit eventDeleteSupplierProduct(_id);
    }
}