import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'details.dart'; 
import 'package:intl/intl.dart';




class HomePage extends StatefulWidget with NavigationStates {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   Size deviceSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Stack(
        overflow: Overflow.visible,
        fit: StackFit.loose,
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
          Positioned(
            left: 330,
            top: 42,
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset("assets/images/user.png"),
              
            ),
            
          ),
         
          Positioned(
            left: 50,
            top: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hi! Anand",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Raleway'
                  )
                ),
                ListView(
                  padding: EdgeInsets.only(top: 20.0),
                  children: <Widget>[
                    
                
                  ]
                ),
                 ],
            ),
          ),
         
                  ListView(
          padding: EdgeInsets.only(top: 100.0),
          children: <Widget> [
            _buildMarquee(),
          ].map(_wrapWithStuff).toList(),
        ),
             
          Positioned(
            left: 30,
            top: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  
                
              ],
            ),
          ),


          Positioned(
            left: 20,
            top: 180,
            right: 20,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => Detailes()));},
                                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                            Center(
                           child: Container(
                            margin: const EdgeInsets.all(10.0),
                            color: Colors.amber[600],
                            width: 320.0,
                            height: 200.0,
                          
                           ),
                           )              
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                 GestureDetector(
                  onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context) => Detailes()));},
                                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                            Center(
                           child: Container(
                            margin: const EdgeInsets.all(10.0),
                            color: Colors.amber[600],
                            width: 330.0,
                            height: 100.0,
                          
                           ),
                           )              
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    



      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Column(
                   children: [
                     IconButton(

                       icon: Icon(Icons.home_outlined),
                       onPressed: (){},
                       iconSize: 32,
                     ),
                     Text(
                       "Home",
                       style: TextStyle(color: Color(0xFF1E255E)),
                     ),
                    
                   ],
                 ),
                Column(
                   children: [
                     IconButton(

                       icon: Icon(Icons.school),
                       onPressed: (){},
                       iconSize: 32,
                     ),
                     Text(
                       "Subjects",
                       style: TextStyle(color: Color(0xFF1E255E)),
                     ),
                    
                   ],
                ),

                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(Icons.add, size: 32, color: Colors.indigo,),
                  ),
                ),

                Column(
                   children: [
                     IconButton(

                       icon: Icon(Icons.event_note),
                       onPressed: (){},
                       iconSize: 32,
                     ),
                     Text(
                       "Mock Test",
                       style: TextStyle(color: Color(0xFF1E255E)),
                     ),
                    
                   ],
                ),
                Column(
                   children: [
                     IconButton(

                       icon: Icon(Icons.person),
                       onPressed: (){
             
                       },
                       iconSize: 32,
                     ),
                     Text(
                       "Profile",
                       style: TextStyle(color: Color(0xFF1E255E)),
                     ),
                    
                   ],
                ),
               ],
          ), 
        ),),
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
Widget _buildMarquee() {
    return Marquee(
      text: 'Enroll Now - Hey Folks We are waiting for your action now. Download Our App', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Raleway'
                  )
    ); 
  }

  

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(height: 50.0, color: Colors.transparent, child: child),
    );
  }