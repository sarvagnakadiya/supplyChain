// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <=0.8.19;

import "./Interfaces/IUserDetails.sol" ;

contract userDetails is IUserDetails{

    mapping(address=>userDetails) public userDetailsMapping;
    address[] public users;
    address[] public suppliers;
    address[] public manufacturers;
    address[] public distributors;

    

    function addUser(userType _type, bytes calldata _name, bytes calldata _physicalAddress,bytes memory _image)public{

         require((userDetailsMapping[msg.sender].userName).length == 0, "User already registered");
         userDetailsMapping[msg.sender] = userDetails(_type,_name,_physicalAddress,_image);
         users.push(msg.sender);
         if(_type == userType.Supplier) suppliers.push(msg.sender);
         if(_type == userType.Manufacturer) manufacturers.push(msg.sender);
         if(_type == userType.Distributor) distributors.push(msg.sender);
         

    }
    function deleteUser(address _address)public{
        require((userDetailsMapping[msg.sender].userName).length == 0, "User not present");
        delete userDetailsMapping[_address];

    }

    function editName(bytes memory _name)public{
        userDetailsMapping[msg.sender].userName = _name;

    }
    function editPhysicalAddress(bytes memory _physicalAddress)public{
        userDetailsMapping[msg.sender].userPhysicalAddress = _physicalAddress;

    }
    function editImage(bytes memory _image)public{
        userDetailsMapping[msg.sender].userImage = _image;
    }

    function getSingleUser(address _address) public view returns(userDetails memory){
        return userDetailsMapping[_address];
    }

    function getAllUsers() public view returns(userDetails[] memory){
        userDetails[] memory userD = new userDetails[](users.length);
        for(uint i=0;i<users.length;i++)
        {
            userD[i] = userDetailsMapping[users[i]];
        }
        return userD;
    }

    function getAllSuppliers() public view returns(userDetails[] memory){
        userDetails[] memory suppD = new userDetails[](suppliers.length);
        for(uint i=0;i<users.length;i++)
        {
            suppD[i] = userDetailsMapping[suppliers[i]];
        }
        return suppD;

    }

      function getAllManufacturers() public view returns(userDetails[] memory){
        userDetails[] memory manuD = new userDetails[](manufacturers.length);
        for(uint i=0;i<users.length;i++)
        {
            manuD[i] = userDetailsMapping[manufacturers[i]];
        }
        return manuD;

    }

      function getAllDistributors() public view returns(userDetails[] memory){
        userDetails[] memory distD = new userDetails[](distributors.length);
        for(uint i=0;i<users.length;i++)
        {
            distD[i] = userDetailsMapping[distributors[i]];
        }
        return distD;

    }

}