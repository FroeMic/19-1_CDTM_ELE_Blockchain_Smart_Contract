pragma solidity >=0.4.22 <0.7.0;

/// @title Micro Task Mangement Tool.
contract MTMT {

    // Struct that store and IPFS reference.
    struct Multihash {
        bytes32 hash;
        uint8 hash_function;
        uint8 size;
    }

    // This declares a new complex type which will
    // be used for variables later.
    // It will represent a single voter.
    struct Task {
        uint256 id; // a unique id of the task
        address owner; // person creating the task
        // uint deadline; // time until the task has to be finished
        Multihash description; // description of the task
        uint256 reward; // Reward payed for the successful completion of the contract
        bool open;
    }

    uint256 private nextTaskID;
    mapping(uint256 => Task) public taskList;

    function MTMT() public {
        nextTaskID = 0;
    }

    function createTask(Multihash description, uint deadline) external {
        Task memory newTask;
        newTask = Task(nextTaskID, msg.sender, description, msg.value, true);
        taskList[nextTaskID] = newTask;
        nextTaskID++;
    }

}