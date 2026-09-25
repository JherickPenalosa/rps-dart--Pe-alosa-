/// ROCK, PAPER, SCISSORS SIMULATION ///

import 'dart:io';

/// This method gets the player names and return list of players
List<String> gettingPlayers() {

  List<String> playersLists = [];

  // --- Player 1 ---
  stdout.write("\n| Enter player 1 name: ");
  String? p1Input = stdin.readLineSync();
  String p1Name = p1Input?.trim() ?? "";
  if (p1Name.isEmpty) {
    p1Name = "Player 1";
    print('| No name entered. Using "$p1Name".');
  }
  playersLists.add(p1Name);

  // --- Player 2 ---
  stdout.write("\n| Enter player 2 name: ");
  String? p2Input = stdin.readLineSync();
  String p2Name = p2Input?.trim() ?? "";
  if (p2Name.isEmpty) {
    p2Name = "Player 2";
    print('| No name entered. Using "$p2Name".');
  }
  playersLists.add(p2Name);

  return playersLists;
}

/// This function process the pick of moves
String getPick(String player) {
  while (true) {
    stdout.write(
      "\n| $player enter your move (rock/paper/scissors): ",
    );
    String? playerPick = stdin.readLineSync();
    String? verify = validatePick(playerPick);

    if (verify != null) {
      return verify;
    }
    print("\n| Invalid move. Please type rock, paper, or scissors");
  }
}
/// This function validates the picked option.
String? validatePick(String? playerPick) {
  if (playerPick == null) {
    return null;
  }
  String pick = playerPick.trim().toLowerCase();

  List<String> options = ['rock', 'paper', 'scissors'];

  if (options.contains(pick)) {
    return pick;
  }
  return null;
}

/// These are the scores
int player1Score = 0;
int player2Score = 0;

/// This function displays the winner and updates the scores.
void whosTheWinner( List<String> players, String p1Pick, String p2Pick,) {
    
  print( "\n| ${players[0]} chose $p1Pick. ${players[1]} chose $p2Pick");
  String? winner = gameRule(players, p1Pick, p2Pick);

  if (winner == players[0]) {
    player1Score++;
  } else if (winner == players[1]) {
    player2Score++;
  }
  String? result =
      winner == null ? null : "$winner wins the round!";
  print('| Result: ${result ?? "It's a draw!"}');
  print(
    "| Score -> ${players[0]}: $player1Score | "
    "${players[1]}: $player2Score",
  );
}
/// This function decides the winner based on the game rules.
String? gameRule(List<String> players, String p1Pick, String p2Pick,) {
  if (p1Pick == p2Pick) {
    return null;
  }
  if (p1Pick == 'rock' && p2Pick == 'scissors') { return players[0]; }
  else if (p1Pick == 'paper' && p2Pick == 'rock') { return players[0]; } 
  else if (p1Pick == 'scissors' && p2Pick == 'paper') { return players[0]; } 
  else { return players[1]; }
}
// Assigned the list collection empty for now
List<String> players = [];

/// This is the main method to run the program
void main() {

  print("\n| === ROCK, PAPER, SCISSORS === ");

  int round = 1;
  String playAgain;

  // Called the getplayername function to get its collection
  players = gettingPlayers();

  do {
    // The game begins here
    print("\n| --- ROUND $round --- ");
    // Player 1 pick
    String p1pick = getPick(players[0]);
    for (int blines = 0; blines < 30; blines++) {
      print('');
    }
    // Player 2 pick
    String p2pick = getPick(players[1]);
    // Call the decide winner function
    whosTheWinner(players, p1pick, p2pick);

    stdout.write("\n| Play again? (y/n): ");
    String? playInput = stdin.readLineSync();
    playAgain = playInput?.trim().toLowerCase() ?? 'n';
    round++;
  }
  while (playAgain.toLowerCase() != 'n');
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