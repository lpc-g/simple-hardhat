// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Merkle {
    function verify(
        bytes32 leaf,
        bytes32 root,
        bytes32[] memory proof
    ) public pure returns (bool) {
        return getRootHash(leaf, proof) == root;
    }

    function getRootHash(
        bytes32 leaf,
        bytes32[] memory proof
    ) public pure returns (bytes32) {
        bytes32 root = leaf;
        for (uint i; i < proof.length; i++) {
            root = generateHash(root, proof[i]);
        }
        return root;
    }

    function generateHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return
            a < b
                ? keccak256(abi.encodePacked(a, b))
                : keccak256(abi.encodePacked(b, a));
    }
}

/**
leaf : 0xb9eb193ea3b7eddb1770e63589ff2bacc1b65c73daa3338c686429d344ae6d41
root : 0x074e7e79ec6d8b64ed0de5b0f0044f461a3a5bb9a6e17af91bea4f2a285eca05
proof: [0x44d052ca287210b65c15c264a3e440afdacfc0b89767162282ecae00ccba52f7,0x3cd6e2901da2e2b4e32d557ee0a9e0cf4b5905854c6520eaedc88fe1ad2f2d9f]
 */
