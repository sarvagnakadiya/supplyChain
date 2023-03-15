// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface IUserDetails {
  struct userDetails{
      bytes userType;
      bytes userName;
      bytes userPhysicalAddress;
      bytes userImage;
  }
  function addUser(bytes calldata _type, bytes calldata _name, bytes calldata _physicalAddress,bytes memory _image)external;
  function deleteUser(bytes memory _address)external;

  function editName(bytes memory _name)external;
  function editPhysicalAddress(bytes memory _physicalAddress)external;
  function editImage(bytes memory _image)external;
}