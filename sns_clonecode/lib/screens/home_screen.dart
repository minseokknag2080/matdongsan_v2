import 'package:flutter/material.dart';
import 'package:sns_clonecode/widgets/follow_wigets.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            // Background image that spans both AppBar and body
            SizedBox(
              height: 50.0,
            ),
            Image(
              image: AssetImage(
                  'assets/images/background.png'), // Replace with your background image
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Colors.transparent, // Make the container transparent
              child: Column(
                children: [
                  Expanded(
                    flex: 15,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Handle individual item tap events here
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                8, 150, 8, 1), // Add top padding
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(44, 106, 245, 1.0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '공지 $index',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: GridView.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0,
                        children: List.generate(
                          8,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => follow_list(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  //
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    '버튼 $index',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
