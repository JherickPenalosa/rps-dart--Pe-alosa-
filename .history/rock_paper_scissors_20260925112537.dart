/// ROCK, PAPER, SCISSORS SIMULATION ///

import 'dart:io';

/// This method gets the user name and return list of players
List<String> gettingPlayers() {
  List<String> players = [];

  // --- Player 1 ---
  stdout.write("\n| Enter player 1 name: ");

String? p1Input = stdin.readLineSync();

String p1Name = p1Input?.trim() ?? "";

if (p1Name.isEmpty) {
  p1Name = "Player 1";
  print('| No name entered. Using "$p1Name".');
}

players.add(p1Name);
  // --- Player 2 ---
  stdout.write("\n| Enter player 2 name: ");
  String? p2Name = stdin.readLineSync()?.trim() ?? "";
  if (p2Name.isEmpty) {
    p2Name = "Player 2";
    print("| No name entered. Using $p2Name");
  }
  players.add(p2Name);

  return players;
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

// Assigned the list collection empty for now
List<String> players = [];
/// This is the main method to run the program
void main() {

  print("\n| === ROCK, PAPER, SCISSORS === ");

  int round = 1;
  String play;

  // Called the getplayername function to get its collection
  players = gettingPlayers();

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