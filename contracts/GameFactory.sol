// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Game.sol';

contract GameFactory {
    address[] public deployedGames;

    function createGame() public {
        //require(getGameByPlayer1(msg.sender) == address(0), "You already created a game.");
        if (deployedGames.length > 0) {
            address lastDeployed = getLastDeployedGame();
            require(Game(lastDeployed).player2() != address(0));
        }
        address newGame = address(new Game(msg.sender));
        deployedGames.push(newGame);
    }

    function joinGame(address _gameAddress) public {
        Game game = Game(_gameAddress);
        require(game.player2() == address(0), "Game already has two players.");
        require(game.player1() != address(0), "Game does not exist.");
        require(msg.sender != game.player1(), "You cannot join your own game.");
        game.startGame(msg.sender);
    }

    function getDeployedGames() public view returns (address[] memory) {
        return deployedGames;
    }

    // Function to get the last played game
    function getLastDeployedGame() public view returns (address) {
        require(deployedGames.length > 0, "The array is empty");
        return deployedGames[deployedGames.length - 1];
    }

    function getCount() public view returns(uint count) {
    return deployedGames.length;
}

    function getGameByPlayer1(address _player1) public view returns (address) {
        for (uint i = 0; i < deployedGames.length; i++) {
            Game game = Game(deployedGames[i]);
            if (game.player1() == _player1 && game.player2() == address(0)) {
                return deployedGames[i];
            }
        }
        return address(0);
    }
}