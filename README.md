#   INSPIRATION
The inspiration for this project comes from the convergence of typically two unrelated topics; Hip Hop and Blockchain/Distributed Ledger Technologies. As a fan of Hip Hop culture, I began to pay more attention to Battle Rap, a subgenre of Hip Hop entertainment but in a sport-like format wherein two rappers face off in an acapella battle of lyricism, wordplay, and performance ability. As I began to follow Battle Rap more closely, it was clear that many of the rap battles did not end in a clear winner because there was no voting mechanism or fair judging in place to do so.

Simultaneously, I was spending a lot of time looking into blockchain and distributed ledger technologies, trying to wrap my head around it. Once I grasped the concept that an encrypted transaction, more specifically a ‘vote’, can be recorded on a distributed ledger, immutable and publicly verifiable, I soon realized that this was the perfect solution to the problem of the need for a fair voting mechanism for not just the battle rap leagues that I'm a fan of, but the 800+ battle rap leagues around the world.

Furthermore, I realized this can also be good to society as an example of how to successfully build a decentralized voting mechanism for any institution that would like to ensure truly fair and democratic online voting processes.

#  WHAT IT DOES?

Gideon is the new home for battle rap. It is a streaming, voting, and gaming platform for the battle rap industry. This means that battle rap leagues will be able to: stream rap battles live or pre-recorded from anywhere in the world, users can now vote on the outcome of rap battles using our decentralized voting mechanism, and with those statistics, users can then also safely participate in online fantasy gaming and betting for the first time.

We will also offer additional features such as league administration, digital & QR code ticketing, merchandising, ad leads, and more to registered leagues.


# Current implementations
1. A RapBattleContract.sol which is the core of the project- this handles the decentralised voting 
2. The RapBattleContract is made decentralised by using timestamp(chainlink keeper) to automatically
    open and close it.
    
    RapBattleVotingContract.sol (Mumbai testnet) address-   "0x16833209fBC3445fD3F0ea5217c8Ad5FAb5eEc00"
    
    
    Merchandize_NFTMarketplace.sol (Mumbai testnet) address- "0x08A6D2B0d7dc426f55F9Dbedd3833E0C8e2E3213"
    
    
    StreamingOnIPFS.sol (Mumbai testnet) address - "0x17C68E3dF6C5c66Ef5A5F598E6EDA686867630BF"
   
   
3. *Moralis as Database and Server*: 
      Backend infrastructure that collects data from the blockchain, offers an API to clients like web apps and mobile apps, indexes the blockchain, provides real-time alerts, coordinates events that are happening on different chains, handles the user life-cycle and so much more.  

      Users' data are stored and managed by  Moralis (theGideonAssociation Server).
      theGideonAssociation AppId: *2Iay0HGgZykTjaZhhAgAeCLwzhkUtUvV63LucAX1*

1. Uploading and Hosting the video stream live rap battle on IPFS
2. Deploying GideonAssociation DApp on Polygon(Mumbai testnet)
3. NFTMarketplace 

      

# Future implementations


   
1. GideonAssociation DApp is proposed to be published on Valist.io
   
2. Implementing a betting interface whereby gamblers can bet on the live battle rap league
   
3. We will also offer additional features such as league administration, digital & QR code ticketing, merchandising, ad leads, and more to registered leagues.


   
4.  Daily/Weekly/Monthly grab prizes: Buying NFTs of battle rappers from an available pool of battle rappers to select from and compete against other users who have also selected or bought. Whichever user has the most successful roster, meaning their roster had the most wins during a given period of time wins the prize 







