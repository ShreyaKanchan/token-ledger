// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TokenLedger {
    string public name = "Portfolio Token";
    string public symbol = "PORT";
    uint8 public immutable decimals = 18;
    uint256 public totalSupply;
    address public immutable owner;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    modifier onlyOwner() { require(msg.sender == owner, "owner only"); _; }
    constructor() { owner = msg.sender; }
    function mint(address to, uint256 amount) external onlyOwner { totalSupply += amount; balanceOf[to] += amount; emit Transfer(address(0), to, amount); }
    function approve(address spender, uint256 amount) external returns (bool) { allowance[msg.sender][spender] = amount; emit Approval(msg.sender, spender, amount); return true; }
    function transfer(address to, uint256 amount) external returns (bool) { _move(msg.sender, to, amount); return true; }
    function transferFrom(address from, address to, uint256 amount) external returns (bool) { require(allowance[from][msg.sender] >= amount, "allowance"); allowance[from][msg.sender] -= amount; _move(from, to, amount); return true; }
    function _move(address from, address to, uint256 amount) internal { require(to != address(0) && balanceOf[from] >= amount, "invalid transfer"); balanceOf[from] -= amount; balanceOf[to] += amount; emit Transfer(from, to, amount); }
}
