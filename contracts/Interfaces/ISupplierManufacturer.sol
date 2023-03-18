// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface ISupplierManufacturer {
  struct supplierManufacturer{
      bytes sp_id;
      address supplierAddress;
      address manufacturerAddress;
      bytes dispatchTime;
      bytes arrivalTime;
  }
  function transferProduct(bytes memory _sp_id, address _supplierAddress,address _manufacturerAddress,bytes memory _dispatchTime,bytes memory _arrivalTime)external;

  function receiveProduct(uint smId, bytes memory _arrivalTime)external;
}