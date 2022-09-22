//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Merchandize_NFTMarketplace is ReentrancyGuard{

    //state variables
    Item[] public arrayOfNFTOnSale;
    address payable public immutable feeAccount; //account that receives fees
    uint256 public immutable feePercent; //the fee percentage on sales
    uint256 public itemCount;
    constructor (uint256 _feePercent){
        feePercent= _feePercent; 
        feeAccount= payable(msg.sender);
    }
    struct Item{
        uint256 itemId;
        address payable seller;
        bool sold;
        IERC721 nft;
        uint256 saleAmount;
        uint256 tokenId;
       
    }
    event itemCreated (
        uint256 itemId,
        address indexed seller,
        address indexed nft,
        uint256 saleAmount,
        uint256 tokenId 

    );
    event Bought(
        address indexed seller,
        address indexed nft,
        uint256 saleAmount,
        uint256 tokenId,
        uint256 itemId,
        address indexed buyer

    );
    mapping (uint256 => Item) public trackEachItem;
    mapping(address => Item) public addressToStruct;
    

    function createItem(IERC721 _nft, uint256 _saleAmount,uint256 _tokenId ) external nonReentrant{
        require(_saleAmount != 0, "specify a price");
        //increment itemCount
        itemCount++;
       
        //transfer nft
        _nft.transferFrom(msg.sender, address(this), _tokenId);
        trackEachItem[itemCount]= Item(
            itemCount, payable(msg.sender), false, _nft, _saleAmount, _tokenId
        );
        addressToStruct[payable(msg.sender)]= Item(
            itemCount, payable(msg.sender), false, _nft, _saleAmount, _tokenId
        );
        emit itemCreated( itemCount, payable(msg.sender), address(_nft ), _saleAmount, _tokenId);

    }
    function purchaseItem(uint256 _itemId) external  payable nonReentrant{
            uint256 _totalPrice= getTotalPrice(_itemId);
            Item storage item= trackEachItem[_itemId];
            require(_itemId > 0 && _itemId <= itemCount, "Item doesn't exist");
            require(msg.value >= _totalPrice, "not enough value to cover the purchase of the item");
            require(!item.sold, "this item is not on sale");

            //pay seller and fee account
            item.seller.transfer(item.saleAmount);
            feeAccount.transfer(_totalPrice-item.saleAmount);

            //update item to sold
            item.sold= true;

            //transfer nft to buyer
            item.nft.transferFrom(address(this), msg.sender, item.tokenId);
        // emit the buy event
        emit Bought(item.seller, address(item.nft),msg.value, item.tokenId, item.itemId, msg.sender);

    }
    function getTotalPrice(uint256 _itemId) public view returns (uint256){
        return ((trackEachItem[_itemId].saleAmount * (100 + feePercent))/100);
    }
    //unsold NFTs

    function fetchOnSale() public view returns(Item[] memory){
      Item[] memory fetchItemArray;

      for( uint256 i= 1; i<= itemCount; i++){
        Item memory itemsStruct= trackEachItem[i];
        fetchItemArray[i]= itemsStruct;
      }
     return fetchItemArray;
    }


}