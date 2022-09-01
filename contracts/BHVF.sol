// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./libraries/Pb.sol";
import "./libraries/PbHeader.sol";
import "./libraries/merkle.sol";

contract BHVF {
    using Pb for Pb.Buffer; // so we can call Pb funcs on Buffer obj

    function getBlockHash(bytes memory raw) public pure returns (bytes[] memory) {
        // if (raw.length == 0) {
        //     return bytes[]{new bytes(0)};
        // }

        bytes[] memory leaves = new bytes[](14);
        Pb.Buffer memory buf = Pb.fromBytes(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.hasMore()) {
            (tag, wire) = buf.decKey();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                leaves[0] = bytes(buf.decBytes());
            }
            else if (tag == 2) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 3) {
                leaves[1] = abi.encodePacked(buf.decVarint());
            }
            else if (tag == 4) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 5) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 6) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 7) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 8) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 9) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 10) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 11) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 12) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 13) {
                leaves[1] = bytes(buf.decBytes());
            }
            else if (tag == 14) {
                leaves[1] = bytes(buf.decBytes());
            }
            else { buf.skipValue(wire); } // skip value of unknown tag
        }
        return leaves;
    }

    function getHeader(bytes memory raw) public pure returns (PbHeader.Header memory){
        return PbHeader.decHeader(raw);
    }

}
