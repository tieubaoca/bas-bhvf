// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library Merkle {
    function hashFromByteSlices(bytes[] memory leaves)
        public
        pure
        returns (bytes32)
    {
        if (leaves.length == 0) {
            return emptyHash();
        } else if (leaves.length == 1) {
            return leafHash(leaves[0]);
        } else {
            uint256 k = getSplitPoint(leaves.length);
            bytes[] memory leftLeaves = new bytes[](k);
            bytes[] memory rightLeaves = new bytes[](leaves.length - k);
            for (uint256 i; i < leaves.length; i++) {
                if (i < k) {
                    leftLeaves[i] = leaves[i];
                } else {
                    rightLeaves[i - k] = leaves[i];
                }
            }
            bytes32 left = hashFromByteSlices(leftLeaves);
            bytes32 right = hashFromByteSlices(rightLeaves);
            return innerHash(left, right);
        }
    }

    function emptyHash() public pure returns (bytes32) {
        return sha256(new bytes(0));
    }

    function leafHash(bytes memory data) public pure returns (bytes32) {
        return sha256(abi.encodePacked(uint8(0), data));
    }

    function innerHash(bytes32 left, bytes32 right)
        public
        pure
        returns (bytes32)
    {
        return sha256(abi.encodePacked(uint8(1), left, right));
    }

    function getSplitPoint(uint256 length) public pure returns (uint256) {
        uint256 splitPoint = 0;
        uint256 originLength = length;
        if (length == 1){
            return 0;
        }
        while (length > 1) {
            length = length / 2;
            splitPoint++;
        }
        if ((2**splitPoint) < originLength){
            return 2**splitPoint;
        } else {
            return 2**(splitPoint - 1);
        }

    }
}
