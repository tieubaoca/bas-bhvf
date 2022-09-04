// Code generated by protoc-gen-sol. DO NOT EDIT.
// source: contracts/libraries/proto/header.proto
pragma solidity >=0.5.0;
import "./Pb.sol";

library PbHeader {
    using Pb for Pb.Buffer;  // so we can call Pb funcs on Buffer obj

    struct Header {
        Version version;   // tag: 1
        string chainId;   // tag: 2
        uint64 height;   // tag: 3
        Timestamp time;   // tag: 4
        BlockID lastBlockId;   // tag: 5
        bytes lastCommitHash;   // tag: 6
        bytes dataHash;   // tag: 7
        bytes validatorsHash;   // tag: 8
        bytes nextValidatorsHash;   // tag: 9
        bytes consensusHash;   // tag: 10
        bytes appHash;   // tag: 11
        bytes lastResultsHash;   // tag: 12
        bytes evidenceHash;   // tag: 13
        bytes proposerAddress;   // tag: 14
    } // end struct Header

    function decHeader(bytes memory raw) internal pure returns (Header memory m) {
        Pb.Buffer memory buf = Pb.fromBytes(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.hasMore()) {
            (tag, wire) = buf.decKey();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.version = decVersion(buf.decBytes());
            }
            else if (tag == 2) {
                m.chainId = string(buf.decBytes());
            }
            else if (tag == 3) {
                m.height = uint64(buf.decVarint());
            }
            else if (tag == 4) {
                m.time = decTimestamp(buf.decBytes());
            }
            else if (tag == 5) {
                m.lastBlockId = decBlockID(buf.decBytes());
            }
            else if (tag == 6) {
                m.lastCommitHash = bytes(buf.decBytes());
            }
            else if (tag == 7) {
                m.dataHash = bytes(buf.decBytes());
            }
            else if (tag == 8) {
                m.validatorsHash = bytes(buf.decBytes());
            }
            else if (tag == 9) {
                m.nextValidatorsHash = bytes(buf.decBytes());
            }
            else if (tag == 10) {
                m.consensusHash = bytes(buf.decBytes());
            }
            else if (tag == 11) {
                m.appHash = bytes(buf.decBytes());
            }
            else if (tag == 12) {
                m.lastResultsHash = bytes(buf.decBytes());
            }
            else if (tag == 13) {
                m.evidenceHash = bytes(buf.decBytes());
            }
            else if (tag == 14) {
                m.proposerAddress = bytes(buf.decBytes());
            }
            else { buf.skipValue(wire); } // skip value of unknown tag
        }
    } // end decoder Header

    struct Version {
        uint64 block;   // tag: 1
        uint64 app;   // tag: 2
    } // end struct Version

    function decVersion(bytes memory raw) internal pure returns (Version memory m) {
        Pb.Buffer memory buf = Pb.fromBytes(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.hasMore()) {
            (tag, wire) = buf.decKey();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.block = uint64(buf.decVarint());
            }
            else if (tag == 2) {
                m.app = uint64(buf.decVarint());
            }
            else { buf.skipValue(wire); } // skip value of unknown tag
        }
    } // end decoder Version

    struct BlockID {
        bytes hash;   // tag: 1
        PartSetHeader partSetHeader;   // tag: 2
    } // end struct BlockID

    function decBlockID(bytes memory raw) internal pure returns (BlockID memory m) {
        Pb.Buffer memory buf = Pb.fromBytes(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.hasMore()) {
            (tag, wire) = buf.decKey();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.hash = bytes(buf.decBytes());
            }
            else if (tag == 2) {
                m.partSetHeader = decPartSetHeader(buf.decBytes());
            }
            else { buf.skipValue(wire); } // skip value of unknown tag
        }
    } // end decoder BlockID

    struct PartSetHeader {
        uint32 total;   // tag: 1
        bytes hash;   // tag: 2
    } // end struct PartSetHeader

    function decPartSetHeader(bytes memory raw) internal pure returns (PartSetHeader memory m) {
        Pb.Buffer memory buf = Pb.fromBytes(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.hasMore()) {
            (tag, wire) = buf.decKey();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.total = uint32(buf.decVarint());
            }
            else if (tag == 2) {
                m.hash = bytes(buf.decBytes());
            }
            else { buf.skipValue(wire); } // skip value of unknown tag
        }
    } // end decoder PartSetHeader

    struct Timestamp {
        uint64 second;   // tag: 1
        uint64 nano;   // tag: 2
    } // end struct Timestamp

    function decTimestamp(bytes memory raw) internal pure returns (Timestamp memory m) {
        Pb.Buffer memory buf = Pb.fromBytes(raw);

        uint tag;
        Pb.WireType wire;
        while (buf.hasMore()) {
            (tag, wire) = buf.decKey();
            if (false) {} // solidity has no switch/case
            else if (tag == 1) {
                m.second = uint64(buf.decVarint());
            }
            else if (tag == 2) {
                m.nano = uint64(buf.decVarint());
            }
            else { buf.skipValue(wire); } // skip value of unknown tag
        }
    } // end decoder Timestamp

}
