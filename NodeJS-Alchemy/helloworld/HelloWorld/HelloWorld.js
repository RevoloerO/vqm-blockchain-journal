import { Network, Alchemy } from 'alchemy-sdk';

/**
*@title HelloWorld
*@dev write program to connect ETH_SEPOLIA network via 
*Alchemy framework
*/
  
const settings = {
  //put APIKEY from alchemy here to connect with server
  apiKey: "_YOUR_API_KEY_HERE",
  network: Network.ETH_SEPOLIA,
};

const alchemy = new Alchemy(settings);

// get the latest block
const latestBlock = alchemy.core.getBlock("latest").then(console.log);