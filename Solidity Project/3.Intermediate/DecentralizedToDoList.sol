// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract DecentralizedTodoList {
    struct Task {
        uint id;
        string description;
        bool completed;
    }

    mapping(address => Task[]) private userTasks;
    mapping(address => uint) private taskCount;

    event TaskAdded(address indexed user, uint taskId, string description);
    event TaskCompleted(address indexed user, uint taskId);
    event TaskDeleted(address indexed user, uint taskId);

    // Add a new task
    function addTask(string memory _description) public {
        uint taskId = taskCount[msg.sender];
        userTasks[msg.sender].push(Task(taskId, _description, false));
        taskCount[msg.sender]++;
        emit TaskAdded(msg.sender, taskId, _description);
    }

    // Mark a task as completed
    function completeTask(uint _taskId) public {
        require(_taskId < taskCount[msg.sender], "Task does not exist");
        userTasks[msg.sender][_taskId].completed = true;
        emit TaskCompleted(msg.sender, _taskId);
    }

    // Delete a task (soft delete by swapping with last task and popping)
    function deleteTask(uint _taskId) public {
        require(_taskId < taskCount[msg.sender], "Task does not exist");
        uint lastTaskIndex = userTasks[msg.sender].length - 1;
        userTasks[msg.sender][_taskId] = userTasks[msg.sender][lastTaskIndex];
        userTasks[msg.sender].pop();
        taskCount[msg.sender]--;
        emit TaskDeleted(msg.sender, _taskId);
    }

    // Get all tasks for the user
    function getTasks() public view returns (Task[] memory) {
        return userTasks[msg.sender];
    }
}