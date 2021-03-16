*/Anomitro Paul*/

pragma solidity ^0.4.18;

contract FinalContract {
 
 address public contractCreatorAddress = msg.sender; 
 string public contractName = "AP45"; 
 
 struct User { 
        bytes32[] activeArticles;
        uint balanceOf; 
    }
 mapping (address => User) public users; 
 address[] private usersList;
 
 
 mapping(bytes32 => string) articles; 
 bytes32[] private articleList;
 
 
 
 
 function userSignArticle(address _address, bytes32 _article) private { 
        users[_address].activeArticles.push(_article);
 }
  
 function userSignArticles(address _address, bytes32[] _articles) public {
   for (uint i = 0; i < _articles.length; i++) userSignArticle(_address, _articles[i]);
   usersList.push(_address);
 }
 
 function returnUserData(address _address) view public returns(bytes32[],uint) { 
        return (users[_address].activeArticles, users[_address].balanceOf);
 }
 
 function setUserTokenBalance(address _address, uint _value) public { 
        users[_address].balanceOf = _value;
        usersList.push(_address); 
 }
 
 function getUserList() view public returns(address[]) { 
        return usersList;
    }
 
 
 
  function addHashValue(string value) public returns(bool){
        articleList.push(keccak256(value));
        return addKeyValueByHash(keccak256(value), value);
    }
 
    function addKeyValueByHash(bytes32 hash, string value) private returns(bool){
        if(bytes(articles[hash]).length != 0) {
            return false;
        }
        articles[hash] = value;
        return true;
    }

    function getValueByHash(bytes32 hash) constant public returns(string) { 
        return articles[hash];
    }
    
    function getArticleList() view public returns(bytes32[]) {
        return articleList;
    }
    
}
