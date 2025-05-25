// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
// import "@openzeppelin/contracts/access/AccessControl.sol";
// import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
// import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
// import "@openzeppelin/contracts/utils/math/Math.sol";

/**
 * @title Payments Contract
 * @dev App management
 */
contract PaymentsContract is Ownable, ReentrancyGuard {
    using SafeERC20 for IERC20;

    uint256 constant MIN_BUY_AMOUNT_CREDITS = 1000;
    uint256 constant MIN_BUY_AMOUNT_PLAN = 3000;

    address owner;
    IERC20 public usdcToken;

    uint256 public totalFunds;
    uint256 public withdrawnFunds;

    mapping(address => mapping(uint256 => uint256)) public planPurchases;
    mapping(address => mapping(uint256 => uint256)) public creditPurchases;

    event PlanPurchased(        
        address indexed buyer,
        uint256 usdcAmount
    );

    event CreditsPurchased(        
        address indexed buyer,
        uint256 usdcAmount
    );

    constructor(address _usdcToken) Ownable(msg.sender) {
        usdcToken = ERC20(_usdcToken);
    }

    function buyCredits(uint256 usdcAmount) external nonReentrant {
        require(
            usdcAmount >= MIN_BUY_AMOUNT_CREDITS,
            "Purchase amount below minimum"
        );

        usdcToken.safeTransferFrom(msg.sender, address(this), usdcAmount);

        // Record purchase
        creditPurchases[msg.sender][block.timestamp] = usdcAmount;

        totalFunds += usdcAmount;

        emit CreditsPurchased(           
            msg.sender,
            usdcAmount
        );
    }

    function buyPlan(uint256 usdcAmount) external nonReentrant {
        require(
            usdcAmount >= MIN_BUY_AMOUNT_PLAN,
            "Purchase amount below minimum"
        );

        usdcToken.safeTransferFrom(msg.sender, address(this), usdcAmount);

        // Record purchase
        planPurchases[msg.sender][block.timestamp] = usdcAmount;

        totalFunds += usdcAmount;

        emit PlanPurchased(           
            msg.sender,
            usdcAmount
        );
    }    

    function withdraw(uint256 amount) public onlyOwner nonReentrant {
        usdcToken.safeTransferFrom(address(this), msg.sender, amount);

        withdrawnFunds += amount;
        totalFunds -= amount;
    }
}