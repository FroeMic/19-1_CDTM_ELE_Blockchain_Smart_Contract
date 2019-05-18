pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

// @title Micro Task Mangement Tool.
contract MTMT {

    struct Submission {
        address owner;
        bytes32 description;
        uint256 voteCount;

        mapping (address => bool) voted;
    }

    struct Task {
        address owner; // person creating the task
        bool open;
        uint256 deadline; // time until the task has to be finished
        uint256 reward; // Reward payed for the successful completion of the contract
        bytes32 description; // description of the task

        //Submission[] submissionList; // List of different people participating in the challenge
    }

    uint256 private nextSubmissionID;

    Task[] internal taskList;
    
    // mapping(address => uint256) public reputationList;

    constructor() public {
        nextSubmissionID = 0;
    }

    // creates a new task
    function createTask(uint256 _index, bytes32 _description, uint256 _deadline) public payable returns (uint256 index) {
        Task memory newTask = Task(msg.sender, true, _deadline, msg.value, _description);
        
        if (_index < taskList.length && taskList[_index].open == false) {
            taskList[_index] = newTask;
            index = _index;
        } else {
            index = taskList.push(newTask);
        }
        return index;
    }

    // // returns a list of all  tasks
    // function getTasks() external {

    // }
    // // returns a list of all open tasks
    // function getOpenTasks() external {

    // }

    // returns a specific task
    function getTask(uint256 _index) external returns (address, bool, uint256, uint256, bytes32) {
        address owner;
        bool open;
        uint256 deadline;
        uint256 reward;
        bytes32 description;

        owner = taskList[_index].owner;
        open = taskList[_index].open;
        deadline = taskList[_index].deadline;
        reward = taskList[_index].reward;
        description = taskList[_index].description;

        return (owner, open, deadline, reward, description);
    }

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