import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:fswitch/fswitch.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(1200, 750);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Code pal";
    win.show();
  });
}

const borderColor = Color(0xFFF1F4FD);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: WindowBorder(
                color: borderColor,
                width: 1,
                child: Row(children: [LeftSide(), RightSide()]))));
  }
}

const sidebarColor = Colors.white;

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Container(
            color: sidebarColor,
            child: Column(
              children: [
                Column(
                  // Left nav bar
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/devpal.png"),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    // Navigation element create
                    SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                            title: new Text(
                              'Create new project',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Container(
                              height: 350,
                              width: 400,
                              child: Column(children: [
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Project name (no spaces)'),
                                ),
                                SizedBox(height: 40),
                                Text(
                                  "Preferences",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 20),
                                Text("Front end"),
                                SizedBox(height: 10),
                                FSwitch(
                                  color: Color(0xFF5468E6),
                                  openColor: Colors.redAccent,
                                  width: 120.0,
                                  height: 35.538,
                                  onChanged: (v) {},
                                  closeChild: Text(
                                    "Bootstrap",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                  openChild: Text(
                                    "React",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text("Back end"),
                                SizedBox(height: 10),
                                FSwitch(
                                  color: Color(0xFF5468E6),
                                  openColor: Colors.redAccent,
                                  width: 120.0,
                                  height: 35.538,
                                  onChanged: (v) {},
                                  closeChild: Text(
                                    "PHP",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                  openChild: Text(
                                    "JS",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                              ]),
                            ),
                            actions: <Widget>[
                              new FlatButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(); // dismisses only the dialog and returns nothing
                                },
                                child: new Text('Create Project Folder', style: GoogleFonts.poppins(color: Color(0xFF5468E6), fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                          width: 160,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Color(0xFF5468E6),
                                Color(0xFF654BDB)
                              ])),
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Create Project",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    )
                                  ]))),
                    ),
                    // Navigation element my projects
                    SizedBox(height: 30),
                    Container(
                        width: 160,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF1F4FD),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "My Projects",
                                    style: GoogleFonts.poppins(),
                                  )
                                ]))),
                    // Navigation element my settings
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => new AlertDialog(
                            title: new Text(
                              'Change your preferences',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Container(
                              height: 250,
                              width: 400,
                              child: Column(children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Preferences",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 20),
                                Text("Front end"),
                                SizedBox(height: 10),
                                FSwitch(
                                  color: Color(0xFF5468E6),
                                  openColor: Colors.redAccent,
                                  width: 120.0,
                                  height: 35.538,
                                  onChanged: (v) {},
                                  closeChild: Text(
                                    "Bootstrap",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                  openChild: Text(
                                    "React",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text("Back end"),
                                SizedBox(height: 10),
                                FSwitch(
                                  color: Color(0xFF5468E6),
                                  openColor: Colors.redAccent,
                                  width: 120.0,
                                  height: 35.538,
                                  onChanged: (v) {},
                                  closeChild: Text(
                                    "PHP",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                  openChild: Text(
                                    "JS",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                              ]),
                            ),
                            actions: <Widget>[
                              new FlatButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop(); // dismisses only the dialog and returns nothing
                                },
                                child: new Text('Save',style: GoogleFonts.poppins(color: Color(0xFF5468E6), fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                          width: 160,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFF1F4FD),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Preferences",
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ]))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height - 387),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.exit_to_app,
                              size: 20,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(
                              Icons.info,
                              size: 20,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            onPressed: () {}),
                      ],
                    )
                  ],
                ),
                WindowTitleBarBox(
                    child: Row(
                  children: [
                    MoveWindow(),
                  ],
                )),
                Expanded(child: Container())
              ],
            )));
  }
}

const backgroundStartColor = Color(0xFFF1F4FD);
const backgroundEndColor = Color(0xFFF1F4FD);

class RightSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        WindowTitleBarBox(
            child: Container(
          color: Colors.white,
          child:
              Row(children: [Expanded(child: MoveWindow()), WindowButtons()]),
        )),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 34,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
                color: Color(0xFFF1F4FD)),
            child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: GradientText(
                      text: "My  Projects",
                      colors: [Color(0xFF5468E6), Color(0xFF654BDB)],
                      style: GoogleFonts.poppins(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width - 500),
                  Icon(Icons.delete, color: Colors.black.withOpacity(0.6)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 0),
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [
                            Color(0xFF5468E6).withOpacity(0.4),
                            Color(0xFF654BDB).withOpacity(0.4)
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.white, size: 50),
                          SizedBox(height: 10),
                          Text(
                            "Create new",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    // Second Project (Uncomment after creation)
                    SizedBox(width: 30),
                    //           Container(
                    //  height: 200,
                    //  width: 190,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //       gradient: LinearGradient(
                    //           colors: [Color(0xFF5468E6).withOpacity(0.7), Color(0xFF654BDB).withOpacity(0.7)])
                    //           ),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               Icon(Icons.language, color: Colors.white,size: 50),
                    //               SizedBox(height:10),
                    //               Text("BitCamp", style: GoogleFonts.poppins(
                    //                 color: Colors.white, fontWeight: FontWeight.bold
                    //               ),),

                    //             ],
                    //           ),),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: GradientText(
                      text: "How to use?",
                      colors: [Color(0xFF5468E6), Color(0xFF654BDB)],
                      style: GoogleFonts.poppins(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                child: Image.asset(
                  "assets/how.gif",
                  height: 260.0,
                  width: 900.0,
                ),
              ),
            ]),
          ),
        ),
      ],
    ));
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: Color(0xFF805306),
    mouseOver: Color(0xFFF6A00C),
    mouseDown: Color(0xFF805306),
    iconMouseOver: Color(0xFF805306),
    iconMouseDown: Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: Color(0xFFD32F2F),
    mouseDown: Color(0xFFB71C1C),
    iconNormal: Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
