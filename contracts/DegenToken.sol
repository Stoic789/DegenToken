// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Pausable, Ownable {
    uint8 private constant _decimals = 0;
    address private _owner;

    struct Item {
        uint256 index;
        string name;
        uint256 price;
        bool isAvailable;
    }

    mapping(address => Item[]) private _ownedItems;
    Item[] private _availableItems;

    constructor() ERC20("Degen", "DGN") {
        _owner = 0x16BB48D0D1d91D26a5097d7A3FDC431f34C955f4;
        _availableItems.push(Item(1, "NFT", 10, true));
        _availableItems.push(Item(2, "Gaming Mouse", 20, true));
        _availableItems.push(Item(3, "Headset", 30, true));
    }

    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    } 
    
     function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }


    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function redeem(uint256 index) public {
        require(index < _availableItems.length, "Invalid item index");

        address sender = _msgSender();
        uint256 senderBalance = balanceOf(sender);

        require(senderBalance >= _availableItems[index].price, "Insufficient balance");

        _burn(sender, _availableItems[index].price);
        _ownedItems[sender].push(_availableItems[index]);
    }

    function transfer(address recipient, uint256 amount) public virtual override whenNotPaused returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function getOwnedItems(address account) public view returns (Item[] memory) {
        return _ownedItems[account];
    }

    function getAvailableItems() public view returns (string[] memory) {
        string[] memory items = new string[](_availableItems.length);

        for (uint256 i = 0; i < _availableItems.length; i++) {
            string memory status = _availableItems[i].isAvailable ? "available" : "not available";
            items[i] = string(
                abi.encodePacked(
                    toString(_availableItems[i].index),
                    ".",
                    _availableItems[i].name,
                    "(",
                    toString(_availableItems[i].price),
                    ")",
                    ", ",
                    status
                )
            );
        }

        return items;
    }

    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
