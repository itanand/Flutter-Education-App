import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart'; 
import 'package:get/get.dart';
import 'package:flutter_application_anand/constants.dart';
import 'package:flutter_application_anand/screens/quiz/quiz_screen.dart';
// import 'package:websafe_svg/websafe_svg.dart';


class MockTest extends StatelessWidget  with NavigationStates{
  @override
 
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MockTest1(),
    );
  }
}


class MockTest1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MockTest'),
        centerTitle: true,
     backgroundColor: Color(0xFF1E255E),
        ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/nh.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        child: Stack(
          children: <Widget>[
             ClipPath(
            clipper: ClippingClass(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*4/7,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF1E255E), Color(0xFF1E255E)],
                ),
              ),      
            ),
          ),
            // WebsafeSvg.asset("assets/images/mockte.svg", fit: BoxFit.fill),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 2), //2/6
                    Text(
                      "Let's Play Quiz,",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text("Enter your informations below",
                    style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)),
                    Spacer(), // 1/6
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFFFFF),
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    Spacer(), // 1/6
                    InkWell(
                      onTap: () => Get.to(QuizScreen()),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          "Lets Start Quiz",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    Spacer(flex: 2), // it will take 2/6 spaces
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ClippingClass extends CustomClipper<Path>{
  @override

    Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var controlPoint = Offset(size.width - (size.width / 2), size.height - 120);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
} 