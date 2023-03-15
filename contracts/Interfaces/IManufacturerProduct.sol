// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface IManufacturerProduct {
  struct manufacturerProduct{
      address[] supplierAddress;
      bytes[] sm_id;    
      bytes mp_name;
      bytes mp_description;
      bytes mp_unit;
      bytes mp_price;
      bytes mp_date;
      bytes mp_expiryDate;
  }
  function addManufacturerProduct(address[] memory _supplierAddress,bytes[] memory _sm_id,bytes calldata _name,bytes calldata _description,bytes memory _unit,bytes memory _price,bytes memory _date,bytes memory _expiryDate)external;
  function deleteProduct(uint _id)external;
}