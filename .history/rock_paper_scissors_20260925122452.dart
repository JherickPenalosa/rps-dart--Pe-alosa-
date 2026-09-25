/// ROCK, PAPER, SCISSORS SIMULATION ///

import 'dart:io';

// Assigned the list collection empty for now
List<String> players = [];

/// This is the main method to run the program
void main() {
  print("\n| === ROCK, PAPER, SCISSORS === ");

  int roundCount = 1;
  String playUtro;
  // Called the getplayername function to get its collection
  players = gettingPlayers();

  do {
    // The game begins here
    print("\n| --- ROUND $roundCount --- ");
    // Player 1 pick
    String p1pick = getPicks(players[0]);
    for (int blines = 0; blines < 30; blines++) {
      print('');
    }
    // Player 2 pick
    String p2pick = getPicks(players[1]);
    // Call the decide winner function
    whosTheWinner(players, p1pick, p2pick);

    stdout.write("\n| Play again? (y/n): ");
    String? playInput = stdin.readLineSync();
    playUtro = playInput?.trim().toLowerCase() ?? 'n';
    roundCount++;
  }
  while (playUtro != 'n');
  // Call the finalscore function
  displayTheFinalScore();
}
/// This is the last function, and this displays the overall winner
void displayTheFinalScore() {
  print("\n| ===== FINAL SCORE ===== |\n");

  print("| Score -> ${players[0]}: $player1Score | ${players[1]}: $player2Score ");
  
  if (player1Score == player2Score) {
    print("\n| It's a tie! ");
  }
  else if (player1Score > player2Score) {
    print("\n| Overall winner: ${players[0]}");
  }
  else {
    print("\n| Overall winner: ${players[1]}");
  }
}