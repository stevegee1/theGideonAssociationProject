//This contract currently support uploading the video on IPFS

//Future implementation: Streaming live video on IPFS on GideonAssociation DApp


//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract StreamingOnIPFS {
   uint256 public videoCount= 0;
   string public name= "RapBattle";

   //struct of videos uploaded

   struct Video{
    uint256 id; //every video with its id
    string hash; // on IPFS
    string title;
    address author;

   }
   event videoUploaded(
    uint256 id,
    string hash,  
    string title,
    address author
   );

   mapping (uint256 => Video) public VideoId; // assigning key ID to each video uploaded

   constructor(){

   }

   function uploadVideo(string memory _videoHash, string memory _title) public {
    require(bytes(_videoHash).length> 0, "error, empty hash"); //the videoHash must exist
    require (bytes(_title).length> 0, "error, no title"); //the video must  have a title
    require(msg.sender != address(0)); //make sure uploader address is not empty
    videoCount++;
    VideoId[videoCount]= Video(videoCount, _videoHash, _title, msg.sender);
    emit videoUploaded(videoCount, _videoHash, _title, msg.sender);

   }

}