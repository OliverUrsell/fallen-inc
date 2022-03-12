import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterSelector extends StatefulWidget {
  const CharacterSelector({Key? key}) : super(key: key);

  @override
  _CharacterSelectorState createState() => _CharacterSelectorState();
}

class _CharacterSelectorState extends State<CharacterSelector> {

  BoxDecoration selectedDecoration = BoxDecoration(
    border: Border.all(
      width: 5,
      color: const Color.fromRGBO(227, 226, 179, 1),
    ),
  );

  BoxDecoration? arellaDecoration, sofiaDecoration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/F1_background.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Row(
          children: [
            Expanded(flex: 1, child: Container(),),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 15.0,
                            color: const Color.fromRGBO(227, 226, 179, 1)
                        )
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 15.0,
                          color: const Color.fromRGBO(53, 45, 107, 1)
                        )
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(width: 3.0, color: const Color.fromRGBO(53, 45, 107, 1)),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromRGBO(227, 226, 179, 1),
                                      width: 9.0,
                                    )
                                )
                              ),
                              child: Text(
                                "Choose your Character...",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.syneMono(
                                  fontSize: 32,
                                  color: const Color.fromRGBO(53, 45, 107, 1)
                                ),
                              ),
                            ),
                          ),
                          FocusableActionDetector(
                            onShowHoverHighlight: (hovering) {
                              setState(() {
                                arellaDecoration = hovering ? selectedDecoration: null;
                              });
                            },
                            mouseCursor: SystemMouseCursors.click,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: arellaDecoration,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Text("Arella",
                                          style: GoogleFonts.syneMono(
                                              fontSize: 32,
                                              color: const Color.fromRGBO(53, 45, 107, 1)
                                          ),
                                        ),
                                        Text("The secret agent who moves through the board to get to the goal",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.syneMono(
                                            fontSize: 24,
                                            color: const Color.fromRGBO(227, 226, 179, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset("assets/Fallen_Arella.png"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FocusableActionDetector(
                            onShowHoverHighlight: (hovering) {
                              setState(() {
                                sofiaDecoration = hovering ? selectedDecoration : null;
                              });
                            },
                            mouseCursor: SystemMouseCursors.click,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: sofiaDecoration,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset("assets/Fallen_Sophia.png"),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Text("Sofia",
                                          style: GoogleFonts.syneMono(
                                              fontSize: 32,
                                              color: const Color.fromRGBO(53, 45, 107, 1)
                                          ),
                                        ),
                                        Text("The tech genius who's helping Arella make her way through. She can't do it without you!",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.syneMono(
                                            fontSize: 24,
                                            color: const Color.fromRGBO(227, 226, 179, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 3.0, color: const Color.fromRGBO(53, 45, 107, 1)),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Or Join A Game:",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.syneMono(
                                      fontSize: 48,
                                      color: const Color.fromRGBO(53, 45, 107, 1)
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 9.0,
                                            color: const Color.fromRGBO(227, 226, 179, 1),
                                          ),
                                        ),
                                        child: TextField(
                                          style: GoogleFonts.syneMono(
                                            fontSize: 48,
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: const Color.fromRGBO(230, 229, 202, 1),
                                            hintText: "Enter Code",
                                            hintStyle: GoogleFonts.syneMono(
                                              fontSize: 48,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: TextButton(
                                          onPressed: () {

                                          },
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(230, 229, 202, 1)),
                                          ),
                                          child: Text("Join",
                                              style: GoogleFonts.syneMono(
                                                fontSize: 48,
                                                color: Colors.white,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: Container(),),
          ],
        ),
      )
    );
  }
}
