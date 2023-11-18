import 'package:flutter/material.dart';

class follow_list extends StatefulWidget {
  const follow_list({super.key});

  @override
  State<follow_list> createState() => _follow_listState();
}

class _follow_listState extends State<follow_list> {
  List<bool> switchValues = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 1 / 9;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(44, 106, 245, 1.0),
        title: Text(
          '알람',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white), //전체아이콘색깔
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(switchValues.length, (index) {
                    return InkWell(
                      onTap: () {
                        // 클릭된 동아리에 대한 작업 수행
                        print('$index 동아리 클릭됨');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              'assets/images/app_logo.png', // 이미지의 경로를 여기에 입력
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '동아리 $index',
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(height: 50),
                          // Switch(
                          //   value: switchValues[index],
                          //   onChanged: (value) {
                          //     setState(() {
                          //       print(value);
                          //       switchValues[index] = value;
                          //     });
                          //   },
                          // ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),

      //
    );
  }
}
