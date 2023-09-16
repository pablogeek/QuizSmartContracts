// test/TestQuizGame.sol
pragma solidity ^0.8.13;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/GameFactory.sol";

contract TestGameFactory {

    GameFactory gameFactory;
    function beforeEach() public {
        gameFactory = new GameFactory();
    }

    function testNoGamesWhenStart() public {
        Assert.equal(gameFactory.getCount(), 0, "Games are not empty");
    }

    function testLastItem() public {
        try gameFactory.getLastDeployedGame() {
            Assert.fail("Expected to not return any game");
        }catch {}
        gameFactory.createGame();
        Assert.equal(gameFactory.getCount(), 1, "There should be 1  game");
    }

    function testCannotCreateGameIfAnotherInProgress() public {
        // Create the first game
        gameFactory.createGame();

        try gameFactory.createGame() {
            Assert.fail("Expected to not be able to create new game before it finishes previous one");
        }catch {}

        Assert.equal(gameFactory.getCount(), 1, "Num of games should be 1");

        // I would really like to test this if it was possible to create msg.sender address in a test
        /*address last = gameFactory.getLastDeployedGame();
        gameFactory.joinGame(last);

        try gameFactory.createGame() {
            
        }catch {
            Assert.fail("Expected to be able to create a new game");
        }*/
    }
}