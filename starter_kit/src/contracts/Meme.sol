pragma solidity 0.5.8;

contract Meme{
    //Smarty Contract code goes here
    string memeHash;

    mapping(address=>bool) public checkFunction;

  struct userHash{
        uint userId;
        string userEmailId;
        string userHash;
        string publickey;
    }

    struct groupHash{
        uint groupId;
        string groupEmailId;
        string groupHash;
        uint groupVersion;
    }

    //Write function
  
       mapping(uint=>userHash) public userInformation;
       mapping(uint=>groupHash) public groupInformation;

    function addUser(string memory _userEmailId,string memory _userHash,string memory _publicKey) public {
        userCount++;
         userInformation[userCount]= userHash(userCount,_userEmailId,_userHash, _publicKey);
          
     }

    uint public userCount=0;

    function changeUserInformation(uint  _userId,string memory _newHash) public {
        uint checkId = _userId;
        string memory newHash=_newHash;
       // require((checkId<= userCount) && (checkId>0), “message to be displayed”);
        if((checkId<= userCount) && (checkId>0)){
            string memory k= userInformation[_userId].userHash;
            k=newHash;
            userInformation[_userId].userHash=k;
        }
    }

    uint public groupCount=0;
    function createGroup(string memory _groupEmailId,string memory _groupHash,string memory _publicKey, uint  _versionId)  public {

        groupCount++;
        groupInformation[groupCount]=groupHash(groupCount,_groupEmailId,_groupHash,_versionId);
    }

       function getuserCount() public view returns(uint)
    {
        return userCount;
    }
}