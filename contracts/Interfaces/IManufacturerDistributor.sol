// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface IManufacturerDistributor {
  struct manufacturerDistributor{
      bytes mp_id;
      address m_address;
      address d_address;
      bytes dispatchTime;
      bytes arrivalTime;
  }
  function transferproduct(bytes memory _mp_id, address _manufacturerAddress,address _distributorAddress,bytes memory _dispatchTime,bytes memory _arrivalTime)external;
  function receiveProduct(uint _mdId, bytes memory _arrivalTime)external;
}