// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface ISupplierProduct {
  struct supplierProduct{
      address supplierAddress;
      bytes sp_name;
      bytes sp_description;
      bytes sp_unit;
      bytes sp_price;
      bytes sp_date;
      bytes sp_expiryDate;
  }
  function addSupplierProduct(bytes calldata _name,bytes calldata _description,bytes memory _unit,bytes memory _price,bytes memory _date,bytes memory _expiryDate)external  ;
  function deleteProduct(uint _id)external ;
}