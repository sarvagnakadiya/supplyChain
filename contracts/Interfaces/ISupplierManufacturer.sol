// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface ISupplierManufacturer {
  struct supplierManufacturer{
      bytes sm_id;
      bytes sp_id;
      bytes s_address;
      bytes m_address;
      bytes dispatchTime;
      bytes arrivalTime;
  }
  function addData(bytes calldata _sm_id,bytes memory _sp_id, bytes calldata _s_address,bytes memory _m_address,bytes memory _dispatchTime,bytes memory _arrivalTime)external;
}