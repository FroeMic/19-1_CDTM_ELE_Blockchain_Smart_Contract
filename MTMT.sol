pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

/// @title Micro Task Mangement Tool.
contract MTMT {

    struct Submission {
        address owner;
        bytes32 description;
        uint256 voteCount;
        
        mapping (address => bool) voted;
    }

    // A single Task
    struct Task {
        address owner; // person creating the task
        bool open;
        uint256 deadline; // time until the task has to be finished
        uint256 reward; // Reward payed for the successful completion of the contract
        
        bytes32 description; // description of the task

        Submission[] submissionList; // List of different people participating in the challenge
    }


    uint256 private nextSubmissionID;

    Task[] internal taskList;
    // mapping(address => uint256) public reputationList;

    constructor() public {
        nextTaskID = 0;
    }

    // creates a new task
    
    function createTask(uint256 _index, bytes32 _description, uint256 _deadline, uint256 _reward) public payable returns (uint256 index) {
        Task memory newTask = (
            msg.sender,
            true,
            _deadline,
            _reward,
            _description,
            new Submission[],
        );
        
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

    // // returns a specific task
    // function getTask(uint256 id) external {
    function getTask(uint256 _id) external returns (uint256,address ,Multihash memory , uint256 ,bool ,Submission[] memory) {
        uint256 id; 
        address owner; 
        Multihash memory description;
        uint256 reward; 
        bool open;
        Submission[] memory submissionList;
       
       id = taskList[_id].id;
       owner = taskList[_id].owner;
       description = taskList[_id].description;
       reward = taskList[_id].reward;
       open = taskList[_id].open;
       submissionList = taskList[_id].submissionList;
       
       return (id, owner, description, reward, open, submissionList);
    }
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