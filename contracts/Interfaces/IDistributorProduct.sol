// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface IDistributorProduct {
  struct distributorProduct{
      address[] manufacturerAddress;
      bytes[] md_id;    
      bytes dp_name;
      bytes dp_description;
      bytes dp_unit;
      bytes dp_price;
      bytes dp_date;
      bytes dp_expiryDate;
  }
  function addDistributorProduct(address[] memory _manufacturerAddress,bytes[] memory _md_id, bytes calldata _name,bytes calldata _description,bytes memory _unit,bytes memory _price,bytes memory _date,bytes memory _expiryDate)external;
  function deleteProduct(uint _id)external;
}