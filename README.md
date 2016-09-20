# Community Store Time

### Javascript-based, turn based strategy game, styled in a laid-back, relaxing way.

A two player, semi-competitive strategy game where you attempt to drop four of your colored tokens in a line, either horizontally, vertically or diagonally.  

All visual and audio elements are designed and implemented to promote relaxation and reduce stress.  These include tropical images, soothing beach noises and slow animations.

![Sample of gameplay](./sample_image.png)

### Controls

Users control is entirely click based.  Each player will click the column they want to place their token in when it is their turn, as indicated in the message center.

## To Play

Visit http://garrettestrin.github.io/connect_four/ to play, or download a .zip of this repo and open index.html in your browser.

### Development process

Technologies used: HTML / CSS / Javascript + jQuery

Columns are set to listen for clicks, at which time, an evaluation will be run to decide what row the token should be placed.  After a token is placed, a function to see if a player has met requirements to win has been achieved yet.  If one has, the message center indicates the winner and welcomes players to play again.  A lifetime score board is styled to the right of the board to indicate how many games each player has won.

![Mockup of layout](./sample_image2.png)

## User Stories

As a user, I interact with the game with a visually pleasing and simple UI.

As a user, I can pick up and play a simple game that is relaxing to play.

## Future implementations

Make code DRY - implement new logic.

## Feature Wish List

* Really Bitchen token animations!

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
