// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFounding{

    enum State { Closed, Opened }

    struct Project {
        string name;
        string decription;
        address payable author;
        State state; // 1: Open, 0: Close
        uint funds;
        uint fundraisingGoal;
    }

    Project[] private projects;

    constructor(){}

    event ChangeState(
        State newState
    );

    event NewFunds(
        address colaborator,
        uint amount
    );

    modifier isAuthor(uint idProject){
        require(projects[idProject].author == msg.sender, "You need to be the project author");
        _;
    }

    modifier isNotAuthor(uint idProject){
        require(projects[idProject].author != msg.sender, "As author you can not fund your own project");
        _;
    }

    function getAmountOfProjects()public view returns(uint) {
        return projects.length;
    }

    function getProject(uint idProject)public view returns(Project memory){
        return projects[idProject];
    }

    function createProject( string memory name, 
                            string memory description, 
                            uint fundraisingGoal)public{
        Project memory project = Project(name, description, payable(msg.sender), State.Opened, 0, fundraisingGoal);
        projects.push(project);
    }

    function fundProject(uint id)public payable isNotAuthor(id){
        require(projects[id].state != State.Closed, "You can't fund becaused the proyect is closed");
        require(msg.value > 0, "Found value must be greater than 0");
        projects[id].author.transfer(msg.value);
        projects[id].funds += msg.value;
        emit NewFunds(msg.sender, msg.value);
    }

    function changeProjectState(uint id, State newState)public isAuthor(id){
        require(projects[id].state != newState, "The newState must be different");
        projects[id].state = newState;
        emit ChangeState(projects[id].state);
    }
}