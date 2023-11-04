// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Game {
     address payable public immutable player1;
     address payable public player2;
     string playerAnswer1;

    constructor(address payable _player1, string memory _playerAnswer) payable {
        require(msg.value >= 0.1 ether, "Minimum 0.1 ETH required to start a game");
        player1 = _player1;
        playerAnswer1 = _playerAnswer;
    }

    function startGame(address payable _player2) external {
        require(player2 == address(0), "Game already has two players.");
        require(player1 != _player2, "You cannot join your own game.");
        player2 = _player2;
        // Initialize game state here.
    }

    function answerQuestion(string memory _playerAnswer) external {
        // Game logic for answering questions.
        // if player1 wins 
        player1.transfer(0.1 ether);
        //else
        player2.transfer(0.1 ether)
    }

    
}