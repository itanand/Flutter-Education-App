import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter_application_anand/sidebar/menu_item.dart';


class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 40,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: const Color(0xFF1E255E),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      ListTile(
                        title: Text(
                          "Anand Mohan",
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "itanand.tech@gmail.com",
                          style: TextStyle( color: Colors.red, fontSize: 18,wordSpacing: 29),
                        ),
                        leading: CircleAvatar(
                          
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.red,
                            
                          ),
                          backgroundColor: Color(0xFFFFFFF),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 20,
                        endIndent: 25,
                      ),
                       MenuItem(
                        icon: Icons.home,
                        title: "Dashboards",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.school,
                       
                        title: "Subjects",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomeScreenClickedEvent);
                        },
                      ),                        
                      MenuItem(
                        icon: Icons.event_note,
                        title: "Mock Test",
                        onTap: () {
                           onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MockTestClickedEvent);
                        },
                      ),
                     
                      MenuItem(
                        icon: Icons.search,
                        title: "My Dictionary",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDictionaryClickedEvent);
                        },
                      ),     
                       MenuItem(
                        icon: Icons.download_sharp,
                        title: "My Downloads",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDownloadsClickedEvent);
                        },
                      ),
                       MenuItem(
                        icon: Icons.book,
                        title: "Notes",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.NotesScreenClickedEvent);
                        },
                      ),
                      
                      
                      MenuItem(
                        icon: Icons.person_add_alt_1_rounded,
                        title: "Suggestions",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.NewsClickedEvent);
                        },
                      ),
                     
                      MenuItem(
                        icon: Icons.group,
                        title: "Membership",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MembershipClickedEvent);
                        },
                        
                      ),
                      MenuItem(
                        icon: Icons.share,
                        title: "Invite Friends",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.InviteFriendsClickedEvent);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.93),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 80,
                      color: Color(0xFF1E255E),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFFFFFFFF),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}