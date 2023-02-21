// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

string constant FOLLOW_NFT_NAME_SUFFIX = '-Follower';
string constant FOLLOW_NFT_SYMBOL_SUFFIX = '-Fl';
string constant COLLECT_NFT_NAME_INFIX = '-Collect-';
string constant COLLECT_NFT_SYMBOL_INFIX = '-Cl-';
uint64 constant FIRST_DELEGATED_EXECUTORS_CONFIG_NUMBER = 1;
uint8 constant MAX_HANDLE_LENGTH = 31;
uint16 constant MAX_PROFILE_IMAGE_URI_LENGTH = 6000;

// We store constants equal to the storage slots here to later access via inline
// assembly without needing to pass storage pointers. The NAME_SLOT_GT_31 slot
// is equivalent to keccak256(NAME_SLOT) and is where the name string is stored
// if the length is greater than 31 bytes.
uint256 constant NAME_SLOT = 0;
uint256 constant TOKEN_DATA_MAPPING_SLOT = 2;
uint256 constant TOKEN_APPROVAL_MAPPING_SLOT = 4;
uint256 constant OPERATOR_APPROVAL_MAPPING_SLOT = 5;
uint256 constant SIG_NONCES_MAPPING_SLOT = 10;
uint256 constant PROTOCOL_STATE_SLOT = 12;
uint256 constant PROFILE_CREATOR_WHITELIST_MAPPING_SLOT = 13;
uint256 constant FOLLOW_MODULE_WHITELIST_MAPPING_SLOT = 14;
uint256 constant COLLECT_MODULE_WHITELIST_MAPPING_SLOT = 15;
uint256 constant REFERENCE_MODULE_WHITELIST_MAPPING_SLOT = 16;
uint256 constant __DEPRECATED_SLOT__DISPATCHER_BY_PROFILE_MAPPING_SLOT = 17; // Deprecated slot.
uint256 constant PROFILE_ID_BY_HANDLE_HASH_MAPPING_SLOT = 18;
uint256 constant PROFILE_BY_ID_MAPPING_SLOT = 19;
uint256 constant PUB_BY_ID_BY_PROFILE_MAPPING_SLOT = 20;
uint256 constant DEFAULT_PROFILE_MAPPING_SLOT = 21; // Deprecated slot, but still needed for V2 migration.
uint256 constant PROFILE_COUNTER_SLOT = 22;
uint256 constant GOVERNANCE_SLOT = 23;
uint256 constant EMERGENCY_ADMIN_SLOT = 24;
uint256 constant DELEGATED_EXECUTOR_CONFIG_MAPPING_SLOT = 25;
uint256 constant PROFILE_METADATA_MAPPING_SLOT = 26;
uint256 constant BLOCK_STATUS_MAPPING_SLOT = 27;
uint256 constant NAME_SLOT_GT_31 = 0x290decd9548b62a8d60345a988386fc84ba6bc95484008f6362f93160ef3e563;

// We store the polygon chain ID and domain separator as constants to save gas.
uint256 constant POLYGON_CHAIN_ID = 137;
bytes32 constant POLYGON_DOMAIN_SEPARATOR = 0x78e10b2874b1a1d4436464e65903d3bdc28b68f8d023df2e47b65f8caa45c4bb;
// keccak256(
//     abi.encode(
//         EIP712_DOMAIN_TYPEHASH,
//         keccak256('Lens Protocol Profiles'),
//         EIP712_REVISION_HASH,
//         POLYGON_CHAIN_ID,
//         address(0xDb46d1Dc155634FbC732f92E853b10B288AD5a1d)
//     )
// );

// Profile struct offsets
// uint256 pubCount;       // offset 0
uint256 constant PROFILE_FOLLOW_MODULE_OFFSET = 1;
uint256 constant PROFILE_FOLLOW_NFT_OFFSET = 2;
uint256 constant PROFILE_HANDLE_OFFSET = 3;
uint256 constant PROFILE_IMAGE_URI_OFFSET = 4;
uint256 constant PROFILE_FOLLOW_NFT_URI_OFFSET = 5;

// Publication struct offsets
// uint256 pointedProfileId;    // offset 0
uint256 constant PUBLICATION_PUB_ID_POINTED_OFFSET = 1;
uint256 constant PUBLICATION_CONTENT_URI_OFFSET = 2; // offset 2
uint256 constant PUBLICATION_REFERENCE_MODULE_OFFSET = 3; // offset 3
uint256 constant PUBLICATION_COLLECT_MODULE_OFFSET = 4; // offset 4
uint256 constant PUBLICATION_COLLECT_NFT_OFFSET = 5; // offset 4

// We also store typehashes here
bytes32 constant EIP712_REVISION_HASH = keccak256('1');
bytes32 constant PERMIT_TYPEHASH = keccak256(
    'Permit(address spender,uint256 tokenId,uint256 nonce,uint256 deadline)'
);
bytes32 constant PERMIT_FOR_ALL_TYPEHASH = keccak256(
    'PermitForAll(address owner,address operator,bool approved,uint256 nonce,uint256 deadline)'
);
bytes32 constant BURN_TYPEHASH = keccak256('Burn(uint256 tokenId,uint256 nonce,uint256 deadline)');
bytes32 constant EIP712_DOMAIN_TYPEHASH = keccak256(
    'EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'
);
bytes32 constant SET_FOLLOW_MODULE_TYPEHASH = keccak256(
    'SetFollowModule(uint256 profileId,address followModule,bytes followModuleInitData,uint256 nonce,uint256 deadline)'
);
bytes32 constant SET_FOLLOW_NFT_URI_TYPEHASH = keccak256(
    'SetFollowNFTURI(uint256 profileId,string followNFTURI,uint256 nonce,uint256 deadline)'
);
bytes32 constant CHANGE_DELEGATED_EXECUTORS_CONFIG_TYPEHASH = keccak256(
    'ChangeDelegatedExecutorsConfig(uint256 delegatorProfileId,address[] executors,bool[] approvals,uint64 configNumber,bool switchToGivenConfig,uint256 nonce,uint256 deadline)'
);
bytes32 constant SET_PROFILE_IMAGE_URI_TYPEHASH = keccak256(
    'SetProfileImageURI(uint256 profileId,string imageURI,uint256 nonce,uint256 deadline)'
);
bytes32 constant POST_TYPEHASH = keccak256(
    'Post(uint256 profileId,string contentURI,address collectModule,bytes collectModuleInitData,address referenceModule,bytes referenceModuleInitData,uint256 nonce,uint256 deadline)'
);
bytes32 constant COMMENT_TYPEHASH = keccak256(
    'Comment(uint256 profileId,string contentURI,uint256 pointedProfileId,uint256 pointedPubId,uint256 referrerProfileId,uint256 referrerPubId,bytes referenceModuleData,address collectModule,bytes collectModuleInitData,address referenceModule,bytes referenceModuleInitData,uint256 nonce,uint256 deadline)'
);
bytes32 constant MIRROR_TYPEHASH = keccak256(
    'Mirror(uint256 profileId,uint256 pointedProfileId,uint256 pointedPubId,uint256 referrerProfileId,uint256 referrerPubId,bytes referenceModuleData,uint256 nonce,uint256 deadline)'
);
bytes32 constant QUOTE_TYPEHASH = keccak256(
    'Quote(uint256 profileId,string contentURI,uint256 pointedProfileId,uint256 pointedPubId,uint256 referrerProfileId,uint256 referrerPubId,bytes referenceModuleData,address collectModule,bytes collectModuleInitData,address referenceModule,bytes referenceModuleInitData,uint256 nonce,uint256 deadline)'
);
bytes32 constant FOLLOW_TYPEHASH = keccak256(
    'Follow(uint256 followerProfileId,uint256[] idsOfProfilesToFollow,uint256[] followTokenIds,bytes[] datas,uint256 nonce,uint256 deadline)'
);
bytes32 constant UNFOLLOW_TYPEHASH = keccak256(
    'Unfollow(uint256 unfollowerProfileId,uint256[] idsOfProfilesToUnfollow,uint256 nonce,uint256 deadline)'
);
bytes32 constant SET_BLOCK_STATUS_TYPEHASH = keccak256(
    'SetBlockStatus(uint256 byProfileId,uint256[] idsOfProfilesToSetBlockStatus,bool[] blockStatus,uint256 nonce,uint256 deadline)'
);
bytes32 constant COLLECT_TYPEHASH = keccak256(
    'Collect(uint256 publicationCollectedProfileId,uint256 publicationCollectedId,uint256 collectorProfileId,uint256 referrerProfileId,uint256 referrerPubId,bytes collectModuleData,uint256 nonce,uint256 deadline)'
);
bytes32 constant SET_PROFILE_METADATA_URI_TYPEHASH = keccak256(
    'SetProfileMetadataURI(uint256 profileId,string metadata,uint256 nonce,uint256 deadline)'
);

bytes4 constant EIP1271_MAGIC_VALUE = 0x1626ba7e;
