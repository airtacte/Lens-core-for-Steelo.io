// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

import {IFollowModule} from '../interfaces/IFollowModule.sol';
import {LensModuleMetadata} from '../modules/LensModuleMetadata.sol';

/**
 * @dev This is a simple mock follow module to be used for testing.
 */
contract MockFollowModule is LensModuleMetadata, IFollowModule {
    function testMockFollowModule() public {
        // Prevents being counted in Foundry Coverage
    }

    constructor(address moduleOwner) LensModuleMetadata(moduleOwner) {}

    function initializeFollowModule(
        uint256 /* profileId */,
        address /* transactionExecutor */,
        bytes calldata data
    ) external pure override returns (bytes memory) {
        uint256 number = abi.decode(data, (uint256));
        require(number == 1, 'MockFollowModule: invalid');
        return new bytes(0);
    }

    function processFollow(
        uint256 followerProfileId,
        uint256 followTokenId,
        address transactionExecutor,
        uint256 profileId,
        bytes calldata data
    ) external pure override returns (bytes memory) {}

    function supportsInterface(bytes4 interfaceID) public pure override returns (bool) {
        return interfaceID == type(IFollowModule).interfaceId || super.supportsInterface(interfaceID);
    }
}
