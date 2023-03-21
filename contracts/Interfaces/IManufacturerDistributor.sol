// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface IManufacturerDistributor {
  struct manufacturerDistributor{
      uint mpId;
      address m_address;
      address d_address;
      uint32 dispatchTime;
      uint32 arrivalTime;
  }
  function transferproduct(uint _mpId, address _manufacturerAddress,address _distributorAddress,uint32 _dispatchTime,uint32 _arrivalTime)external;
  function receiveProduct(uint _mdId)external;
}