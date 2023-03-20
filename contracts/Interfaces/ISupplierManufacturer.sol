// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface ISupplierManufacturer {
  struct supplierManufacturer{
      uint spId;
      address supplierAddress;
      address manufacturerAddress;
      uint32 dispatchTime;
      uint32 arrivalTime;
  }
  function transferProduct(uint _spId, address _supplierAddress,address _manufacturerAddress,uint32 _dispatchTime,uint32 _arrivalTime)external;

  function receiveProduct(uint smId, uint32 _arrivalTime)external;
}