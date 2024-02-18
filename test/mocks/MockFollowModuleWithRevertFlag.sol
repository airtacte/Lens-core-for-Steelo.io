// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

import {IFollowModule} from '../interfaces/IFollowModule.sol';
import {LensModuleMetadata} from '../modules/LensModuleMetadata.sol';

/**
 * @dev This is a simple mock follow module to be used for testing revert cases on processFollow.
 */
contract MockFollowModuleWithRevertFlag is LensModuleMetadata, IFollowModule {
    function testMockFollowModuleWithRevertFlag() public {
        // Prevents being counted in Foundry Coverage
    }

    error MockFollowModuleReverted();

    constructor(address moduleOwner) LensModuleMetadata(moduleOwner) {}

    function initializeFollowModule(
        uint256 /* profileId */,
        address /* transactionExecutor */,
        bytes calldata /* data */
    ) external pure override returns (bytes memory) {
        return new bytes(0);
    }

    function processFollow(
        uint256 /* followerProfileId */,
        uint256 /* followTokenId */,
        address /* transactionExecutor */,
        uint256 /* profileId */,
        bytes calldata data
    ) external pure override returns (bytes memory) {
        if (abi.decode(data, (bool))) {
            revert MockFollowModuleReverted();
        }
        return '';
    }

    function supportsInterface(bytes4 interfaceID) public pure override returns (bool) {
        return interfaceID == type(IFollowModule).interfaceId || super.supportsInterface(interfaceID);
    }
}
