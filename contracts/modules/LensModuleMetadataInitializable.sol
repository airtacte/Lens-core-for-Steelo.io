// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {LensModuleMetadata} from '../modules/LensModuleMetadata.sol';

contract LensModuleMetadataInitializable is LensModuleMetadata {
    constructor(address owner_) LensModuleMetadata(owner_) {}

    function initialize(address moduleOwner) external virtual {
        if (owner() != address(0) || moduleOwner == address(0)) {
            revert();
        }
        _transferOwnership(moduleOwner);
    }
}
