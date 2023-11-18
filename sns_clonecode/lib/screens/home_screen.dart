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
                      // itemCount: imagePaths
                      //     .length, // Set itemCount to the number of images
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        // Replace these paths with the actual paths to your images
                        List<String> imagePaths = [
                          'assets/images/asc.jpg',
                          'assets/images/youth.jpg',
                          'assets/images/app_logo.png',
                          'assets/images/asc.jpg',
                          'assets/images/asc.jpg',
                          // Add paths for the remaining images
                        ];

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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  imagePaths[
                                      index], // Use the image path for the current index
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  //
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
                            List<String> buttonTexts = [
                              "공연예술",
                              "사회활동",
                              "생활체육",
                              "예술전시",
                              "음악연주",
                              "종교활동",
                              "학술연구",
                              "더보기",
                            ];

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
                                  color: Color.fromARGB(255, 181, 190, 234),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    buttonTexts[index],
                                    style: TextStyle(color: Colors.black),
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
