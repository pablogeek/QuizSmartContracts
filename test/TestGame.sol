// test/TestQuizGame.sol
pragma solidity ^0.8.13;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Game.sol";

contract TestGame {

    Game quizGame;
    function beforeEach() public {
        quizGame = new Game(msg.sender);
    }

    function testPlayer1IsSet() public {
        address expectedPlayer1 = address(msg.sender);
        address actualPlayer1 = quizGame.player1();
        Assert.equal(actualPlayer1, expectedPlayer1, "Player1 should be set.");
    }

    function testPlayer2IsSet() public { 
        address expectedPlayer2 = address(this);
        quizGame.startGame(expectedPlayer2);
        address actualPlayer2 = quizGame.player2();
        Assert.equal(actualPlayer2, expectedPlayer2, "Player2 should be set.");
    }
}