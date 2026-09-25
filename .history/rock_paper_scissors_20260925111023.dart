/// ROCK, PAPER, SCISSORS SIMULATION ///

import 'dart:io';

/// This method gets the user name and return list of players
List<String> getUserName() {

  List<String> players = [];

  // This is for inputting each players name
  stdout.write("\n| Enter player 1 name: ");
  String? p1_name = stdin.readLineSync() ?? null;
  // Condition if the player did not input name
  if (p1_name == null) {
    print("\n| No name entered. Using $p1_name");
  }
  players.add(p1_name);

  stdout.write("\n| Enter player 2 name: ");
  String? p2_name = stdin.readLineSync() ?? 'Player 2';

  if (p1_name == "Player 2") {
    print("\n| (No name entered. Using $p2_name)");
  }
  players.add(p2_name);

  return players;
}

/// This function process the pick of moves
String getPick(String player) {

  while (true) {

    stdout.write("\n| $player enter your move (rock/paper/scissors): ");
    String playerPick = stdin.readLineSync() ?? '';

    bool verify = validatePick(playerPick);

    if (verify == true) {
      return playerPick;
    }
    else {
      continue;
    }
  }
}
/// This method validates the picked options
bool validatePick(String playerPick) {

  String pick = playerPick.trim().toLowerCase();  // This accepts uppercased or spaced

  List<String> options = ['rock', 'paper', 'scissors'];

  if (pick == '' || !options.contains(pick)) {
    print("\n| Invalid move. Please type rock, paper, or scissors ");
    return false;
  }
  else {
    return true;
  }
}



/// These are the scores
int player1Score = 0;
int player2Score = 0;

/// This class is used to display winner
void whosTheWinner(List<String> players, String p1_pick, String p2_pick) {

  print("\n| ${players[0]} chose $p1_pick. ${players[1]} chose $p2_pick ");
  String result = gameRule(players, p1_pick, p2_pick);
  if (result.contains(players[0])) player1Score++;
  if (result.contains(players[1])) player2Score++;
  
  print("| Result: $result");
  print("| Score -> ${players[0]}: $player1Score | ${players[1]}: $player2Score ");

}



/// This class decides whos the winner by game rule
String gameRule(List<String> players, String p1_pick, String p2_pick) {

  String message = '';

  if (p1_pick == p2_pick) {
    message = "The game is tie";
  }
  else {

    if (p1_pick == 'rock' && p2_pick == 'scissors') {
      message = "${players[0]} wins the round";
    }
    else if (p1_pick == 'paper' && p2_pick == 'rock') {
      message = "${players[0]} wins the round";
    }
    else if (p1_pick == 'scissors' && p2_pick == 'paper') {
      message = "${players[0]} wins the round";
    }
    else {
      message = "${players[1]} wins the round";
    }
  }

  return message;
}


List<String> players = [];
void main() {

  print("\n| === ROCK, PAPER, SCISSOR GAME === ");

  int round = 1;
  String play;

  // Called the getplayername function
  players = getUserName();

  do {

    // The game begins here
    print("\n| --- ROUND $round --- ");

    // Player 1 pick
    String p1_pick = getPick(players[0]);

    for (int blines = 0; blines < 30; blines++) {
      print('');
    }

    // Player 2 pick
    String p2_pick = getPick(players[1]);

    // Call the decide winner function
    whosTheWinner(players, p1_pick, p2_pick);

    stdout.write("\n| Play again? (y/n): ");
    play = stdin.readLineSync() ?? 'n';

    round++;

  }
  while (play.toLowerCase() != 'n');

  // Call the finalscore function
  finalScore();
}

/// This is the last function, and this displays the overall winner
void finalScore() {

  print("\n| ===== FINAL SCORE ===== |\n");

  print("| Score -> ${players[0]}: $player1Score | ${players[1]}: $player2Score ");
  if (player1Score == player2Score) {
    print("\n| It's a draw! ");
  }
  else if (player1Score > player2Score) {
    print("\n| Overall winner: ${players[0]}");
  }
  else {
    print("\n| Overall winner: ${players[1]}");
  }
}