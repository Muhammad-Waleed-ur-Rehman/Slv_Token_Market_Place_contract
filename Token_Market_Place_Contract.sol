// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract TokenMarketPlace {

uint256 public constant TOKEN_PRICE = 1 ether;
     uint256 private reseverdOrderedTokens; 

     error TokenMarketplace_ZeroNumberOfTokens(uint256 numberOfTokens);
     error TokenMarketplace_InsufficientEthPayment(uint256 expectedPayment,uint256 actualPayment);
     
     function _isNumberOfTokensZero(uint256 numberOfTokens) internal pure {
         if(numberOfTokens==0){
            revert TokenMarketplace_ZeroNumberOfTokens(numberOfTokens);
         }
     }

     function _checkEthPayment(uint256 numberOfTokens) internal view{
        if(numberOfTokens*TOKEN_PRICE!=msg.value){
            revert TokenMarketplace_InsufficientEthPayment(numberOfTokens*TOKEN_PRICE,msg.value);
         }
     }
     
     function buyTokensFromMarketplace(uint256 numberOfTokens) external payable{
          _isNumberOfTokensZero(numberOfTokens);
          _checkEthPayment(numberOfTokens);
     }
}
