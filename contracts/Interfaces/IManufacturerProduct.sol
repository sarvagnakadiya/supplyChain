// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface IManufacturerProduct {
  struct manufacturerProduct{
      address[] supplierAddress;
      uint[] smId;    
      bytes mp_name;
      bytes mp_description;
      uint128 mp_unit;
      uint128 mp_price;
      uint32 mp_date;
      uint32 mp_expiryDate;
  }

  event eventAddManufacturerProduct(uint indexed  _mpId,address[] indexed _supplierAddress, uint[] indexed  _smId, bytes _name,bytes _description,uint128 _unit,uint128 _price,uint32 _date,uint32 _expiryDate);
  event eventDeleteManufacturerProduct(uint _Id);
  
  function addManufacturerProduct(address[] memory _supplierAddress,uint[] memory _smId,bytes calldata _name,bytes calldata _description,uint128 _unit,uint128 _price,uint32 _date,uint32 _expiryDate)external;
  function deleteProduct(uint _id)external;
}