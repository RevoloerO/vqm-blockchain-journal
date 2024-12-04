/**
*@title HelloWorld
*@dev write NodeJS program to fecth coin price from Alchemy API
*/

const url = 'https://api.g.alchemy.com/prices/v1/tokens/by-symbol?symbols=ETH&symbols=USDC&symbols=BTC';
const headers = {
    'Accept': 'application/json',
    //put APIKEY from alchemy here to connect with server
    'Authorization': 'Bearer _YOUR_API_KEY_HERE_'
};

fetch(url, {
    method: 'GET',
    headers: headers
})
.then(response => response.json())
.then(data => console.log(JSON.stringify(data)))
.catch(error => console.error('Error:', error));