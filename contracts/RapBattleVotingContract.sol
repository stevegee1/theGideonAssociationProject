//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//This is a voting contract
import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract RapBattleVotingContract is Ownable{
 
 AggregatorV3Interface internal priceFeed;

 
 //defines the contestants(Rappers) structs
   struct Contestants{
    string name;  //name of the contestant (Rapper)
    uint256 voteCount;  //number of votes accrued by the contestant
   }

//defines the voter's struct
struct Voters{
    bool authorized; //check if the address is authorized to vote or not
    bool hasVoted; //check if the voter is has voted or not
    string name;  //name of the voter
    uint256 whom; //this defines who the voter is voting for among the contestants(rappers)
}

string public rapBattleLeagueDescription; // this describes the Rap battle league
mapping (address => Voters) public addressToVotersStruct;

//array of Contestants struct
Contestants[] public contestantArray;

uint256 public totalVotes; // defines totalVotes for each rap battle league

constructor(string memory battleName){
    rapBattleLeagueDescription=battleName;
    priceFeed= AggregatorV3Interface(0xAB594600376Ec9fD91F8e885dADF0CE036862dE0) ;// Matic/USD    	
   
}

//this function gets the latest price of USDC/USD

function getLatestPrice() public view returns(uint256){
    (, int price, , ,)= priceFeed.latestRoundData();
    return uint256( price * 10000000000);
}

function getConversionRate(uint256 _VoteTip) public view returns(uint256){
   uint256 maticPrice= getLatestPrice();
   uint256 maticAmountInUSD= (maticPrice * _VoteTip) / 10**18;
   return maticAmountInUSD;


}
//this function adds contestants. This function can only be called by the admin (deployer)
function addContestant(string memory _contestantName ) public onlyOwner {
    contestantArray.push(Contestants(_contestantName, 0));
}
// if you ain't a subscriber, you can't vote!
function authorizedVoters(address _voterAddress) public onlyOwner{
    addressToVotersStruct[_voterAddress].authorized= true;
}
//this function returns the number of contestants
function numOfContestants() public view returns(uint256){
    return contestantArray.length;
}
//Voters needs to tip the contract
function vote(uint256 _contestantIndex)payable public {
    uint256  tipCharge= 1 * 10**18;
    require (getConversionRate(msg.value)==tipCharge, "Unable to vote! you have to have  1 USD equivalent of Matic in your wallet");
    require(addressToVotersStruct[msg.sender].authorized, "Sorry, this account is not authorized to vote");
    require(!addressToVotersStruct[msg.sender].hasVoted, "Sorry, this account has voted!");
    addressToVotersStruct[msg.sender].whom= _contestantIndex;
    contestantArray[_contestantIndex].voteCount +=1;
    addressToVotersStruct[msg.sender].hasVoted=true;
    totalVotes++;

}






}
