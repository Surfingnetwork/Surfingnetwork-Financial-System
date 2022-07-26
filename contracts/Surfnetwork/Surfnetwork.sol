pragma solidity ^0.8.0;
import "../interfaces/token20/IERC20.sol";
import '../lib/TransferHelper.sol';

contract Surfnetwork {
    uint private reserve;
    address sur;
    uint amount;
    constructor(){}
    function init(address _sur) public {
        sur = _sur;
    }
    
    function depositToken(address to,uint month,uint value) external override{
        require(month==0||month==3||month==6||month==12||month==24||month==36,"Deposit month error");

        TransferHelper.safeTransferFrom(rbt,to,address(this), value);
        uint balance=IERC20(sur).balanceOf(address(this));
        amount=balance-reserve;
        reserve = balance;
    }
    
    function withdrawa(address to,uint tokenId) external override{
        uint32 blockTime = uint32(block.timestamp % 2 ** 32);
        uint value=amount;
        TransferHelper.safeTransfer(sur, to, value);
        uint balance=IERC20(sur).balanceOf(address(this)); 
        reserve =balance ;       
    }
}
