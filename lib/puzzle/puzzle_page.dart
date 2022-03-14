import 'package:fallen_inc/pubnub.dart';
import 'package:fallen_inc/puzzle/puzzle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PuzzlePage extends StatefulWidget {

  final Puzzle puzzle;

  const PuzzlePage({Key? key, required this.puzzle}) : super(key: key);

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    String instructions;
    switch(widget.puzzle.mode){
      case PuzzleMode.slider:
        instructions = """SOPHIA: INSTRUCTIONS
CLICK A TILE AND MOVE IT INTO AN EMPTY SPACE WITH THE ARROW KEYS OR W, A, S, D TO CONNECT THE PATHS FOR ARELLA
PRESS R TO RESTART
IF YOU GO ADJACENT TO A GUARD YOU LOSE""";
        break;
      case PuzzleMode.player:
        instructions = """ARELLA: INSTRUCTIONS
MOVE ARELLA ALONG CONNECTING PATHS USING THE ARROW KEYS OR W, A, S, D TO REACH THE ELEVATOR TO THE NEXT FLOOR
PRESS R TO RESTART
IF YOU GO ADJACENT TO A GUARD YOU LOSE""";
        break;
      default:
        instructions = "ERROR";
        break;
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/F1_background.png"),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(163, 161, 171, 1),
                border: Border.all(
                  width: 10.0,
                  color: const Color.fromRGBO(25, 21, 49, 1),
                ),
              ),
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(5.0),
              child: Text("Code:\n${PubNubInteractor.mono!.code}",
                textAlign: TextAlign.center,
                style: GoogleFonts.syneMono(
                    fontSize: screenSize.height/40,
                    color: Colors.white,
                ),
              ),
            ),
            Center(child: widget.puzzle),
            Container(
              width: screenSize.width/2,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(163, 161, 171, 1),
                border: Border.all(
                  width: 10.0,
                  color: const Color.fromRGBO(25, 21, 49, 1),
                ),
              ),
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(5.0),
              child: Text(instructions,
                textAlign: TextAlign.center,
                style: GoogleFonts.syneMono(
                  fontSize: screenSize.height/60,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
