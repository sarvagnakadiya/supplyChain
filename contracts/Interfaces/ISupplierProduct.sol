// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface ISupplierProduct {
  struct supplierProduct{
      address supplierAddress;
      bytes sp_name;
      bytes sp_description;
      uint128 sp_unit;
      uint128 sp_price;
      uint32 sp_date;
      uint32 sp_expiryDate;
  }

  event eventAddSupplierProduct(uint indexed _spid,address indexed _address, bytes _name,bytes _description,uint128 _unit,uint128 _price,uint32 _date,uint32 _expiryDate, uint256 _timeAdded);
  event eventDeleteSupplierProduct(uint indexed _id);
  
  function addSupplierProduct(bytes calldata _name,bytes calldata _description,uint128 _unit,uint128 _price,uint32 _date,uint32 _expiryDate)external  ;
  function deleteProduct(uint _id)external ;
}