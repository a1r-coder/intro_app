import 'package:flutter/material.dart';
import 'package:intro_app/pages/home_page.dart';
import 'package:intro_app/utils/strings.dart';

class homework extends StatefulWidget {
  const homework({super.key});

  static final String id = "Homework";
  @override
  State<homework> createState() => _homeworkState();
}

class _homeworkState extends State<homework> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: pageController,
            children: [
              makePage(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent
              ),
              makePage(
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent
              ),
              makePage(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Visibility(
            visible: currentIndex == 2,
            child: Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _buildSkip(),
            ),
          ),),
        ],
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50,bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title,style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text(content,style: TextStyle(color: Colors.grey,fontSize: 20),textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }


  Widget _Skip(bool isActive) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, Home_page.id);
            },
            child: Text("Skip",style: TextStyle(color: Colors.red,),),
          )
        ],
      ),
    ),
    );
  }
  List<Widget> _buildSkip() {
    List<Widget> indicators = [];
      if (currentIndex == 2) {
        indicators.add(_Skip(true));
      } else {
        indicators.add(_Skip(false));
      }

    return indicators;
  }
}
