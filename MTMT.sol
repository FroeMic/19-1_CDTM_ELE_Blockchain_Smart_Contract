pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

/// @title Micro Task Mangement Tool.
contract MTMT {

    // Struct that stores and IPFS reference.
    struct Multihash {
        bytes32 hash;
        uint8 hash_function;
        uint8 size;
    }

    enum VoteState {OPEN, DECLINED, ACCEPTED}

    struct Vote {
        address voter;
        bool approved;
        uint256 reputation;
    }

    struct Submission {
        uint256 id;
        address owner;
        Multihash description;
        VoteState state;
        mapping(uint256 => Vote) voteList;
    }

    // A single Task
    struct Task {
        uint256 id; // a unique id of the task
        address owner; // person creating the task
        // uint deadline; // time until the task has to be finished
        Multihash description; // description of the task
        uint256 reward; // Reward payed for the successful completion of the contract
        bool open;
        mapping(uint256 => Submission) submissionList;
    }


    uint256 private nextTaskID;
    uint256 private nextSubmissionID;

    mapping(uint256 => Task) public taskList;
    mapping(address => uint256) public reputationList;

    constructor() public {
        nextTaskID = 0;
    }

    // creates a new task
    function createTask(Multihash memory description, uint deadline) public payable {
        taskList[nextTaskID] = Task(nextTaskID, msg.sender, description, msg.value, true);
        nextTaskID++;
    }

    // // returns a list of all  tasks
    // function getTasks() external {

    // }
    // // returns a list of all open tasks
    // function getOpenTasks() external {

    // }

    // // returns a specific task
    // function getTask(uint256 id) external {

    // }

    // // adds a new submission for a task
    // function addSubmission(uint256 task_id, Multihash calldata description) external {

    // }

    // function addVote(uint256 submission_id, bool approved) external {

    //     // Todo: if the 5th submissions is triggered, close the task
    // }    
    
    
    // function terminateTask() external {
    //     // can only be called after the deadline of a task
    //     // transfers the reward back to the owner
    // }

    // function evaluateTask(uint256 task_id) internal {
    //     // 1. get all submissions
    //     // 2. count approved/disapproved votes
    //     // 2.1 If disapproved, set state to DECLINED
    //     // 2.2 If approved, set state to APPROVED, pay out reward and close task
    //     // 3. update reputation
    // }

    // function transferReward(uint256 task_id) internal {
        
    // }

    // function updateReputation() internal {

    // }

}