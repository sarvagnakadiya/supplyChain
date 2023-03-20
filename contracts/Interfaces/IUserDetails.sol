// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

interface IUserDetails {

   enum userType {
    Supplier,
    Manufacturer,
    Distributor
  } 
  struct userDetails{
      userType userType;
      bytes userName;
      bytes userPhysicalAddress;
      bytes userImage;
  }
  event eventUserData(address _address, userType _type, bytes _name, bytes _physicalAddress,bytes _image, uint256 _timeUpdated);
  event eventDeleteUser(address _address);

  function addUser(userType _type, bytes calldata _name, bytes calldata _physicalAddress,bytes memory _image)external;
  function deleteUser(address _address)external;
  function editName(bytes memory _name)external;
  function editPhysicalAddress(bytes memory _physicalAddress)external;
  function editImage(bytes memory _image)external;
}