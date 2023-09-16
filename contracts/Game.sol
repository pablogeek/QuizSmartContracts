// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Game {
     address public immutable player1;
     address public player2;

    constructor(address _player1) {
        player1 = _player1;
    }

    function startGame(address _player2) external {
        require(player2 == address(0), "Game already has two players.");
        require(player1 != _player2, "You cannot join your own game.");
        player2 = _player2;
        // Initialize game state here.
    }

    function answerQuestion(string memory _playerAnswer) external {
        // Game logic for answering questions.
    }
}