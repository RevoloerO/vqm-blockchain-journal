// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/* 
*@title Decentralized Job Board
*@dev This smart contract allows employers to post job listings and freelancers to apply. Payments are held in escrow and released upon job completion.
*@custom:dev-run-script scripts/deploy_with_ethers.ts
*@author: vqm
*/

contract DecentralizedJobBoard is ReentrancyGuard {
    struct Job {
        uint id;
        address employer;
        string description;
        uint payment;
        bool isFilled;
        address freelancer;
    }

    uint public jobCounter;
    mapping(uint => Job) public jobs;
    mapping(address => uint) public balances;

    event JobPosted(uint indexed jobId, address indexed employer, string description, uint payment);
    event JobApplied(uint indexed jobId, address indexed freelancer);
    event JobCompleted(uint indexed jobId, address indexed freelancer, uint payment);
    event Withdrawal(address indexed user, uint amount, bool success);

    // Post a job
    function postJob(string memory _description) public payable {
        require(msg.value > 0, "Payment must be greater than zero");
        jobs[jobCounter] = Job(jobCounter, msg.sender, _description, msg.value, false, address(0));
        emit JobPosted(jobCounter, msg.sender, _description, msg.value);
        jobCounter++;
    }

    // Apply for a job
    function applyForJob(uint _jobId) public {
        require(jobs[_jobId].id == _jobId, "Job does not exist");
        Job storage job = jobs[_jobId];
        require(!job.isFilled, "Job is already filled");
        require(job.freelancer == address(0), "Job already has an applicant");
        
        job.freelancer = msg.sender;
        emit JobApplied(_jobId, msg.sender);
    }

    // Mark job as completed and release payment
    function completeJob(uint _jobId) public {
        require(jobs[_jobId].id == _jobId, "Job does not exist");
        Job storage job = jobs[_jobId];
        require(job.freelancer == msg.sender, "Only assigned freelancer can complete the job");
        require(!job.isFilled, "Job is already completed");

        job.isFilled = true;
        balances[job.freelancer] += job.payment;
        emit JobCompleted(_jobId, job.freelancer, job.payment);
    }

    // Withdraw earnings
    function withdraw() public nonReentrant {
        uint amount = balances[msg.sender];
        require(amount > 0, "No funds to withdraw");
        balances[msg.sender] = 0;
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        emit Withdrawal(msg.sender, amount, success);
        require(success, "Transfer failed");
    }
}
