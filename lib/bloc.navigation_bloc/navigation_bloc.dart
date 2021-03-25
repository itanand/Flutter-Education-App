import 'package:bloc/bloc.dart';
import 'package:flutter_application_anand/pages/mydownloads.dart';
import 'package:flutter_application_anand/pages/news.dart';
import 'package:flutter_application_anand/pages/homepage.dart';
import 'package:flutter_application_anand/pages/mocktest.dart';
import 'package:flutter_application_anand/pages/membership.dart';
import 'package:flutter_application_anand/pages/course.dart';
import 'package:flutter_application_anand/pages/notes_screen.dart';
import 'package:flutter_application_anand/pages/subjects.dart';
import 'package:flutter_application_anand/screens/home_screen.dart';
import 'package:flutter_application_anand/pages/invite_friends.dart';




enum NavigationEvents {
  HomePageClickedEvent,
  MockTestClickedEvent,
  NewsClickedEvent,
  ProfileScreenClickedEvent,
  CoursesClickedEvent,
  NotesScreenClickedEvent,
  HomeScreenClickedEvent,
  SubjectsClickedEvent,
  MyDictionaryClickedEvent,
  InviteFriendsClickedEvent,
  MyDownloadsClickedEvent,
  MembershipClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.NewsClickedEvent:
        yield News();
        break;
      case NavigationEvents.MockTestClickedEvent:
        yield MockTest();
        break;
      case NavigationEvents.MyDictionaryClickedEvent:
        yield Courses();
        break; 
        case NavigationEvents.MyDownloadsClickedEvent:
        yield MyDownloads();
        break; 
      case NavigationEvents.HomeScreenClickedEvent:
        yield HomeScreen();
        break;
      case NavigationEvents.NotesScreenClickedEvent:
        yield NotesScreen();
        break; 
      case NavigationEvents.SubjectsClickedEvent:
        yield Subjects();
        break; 
      case NavigationEvents.InviteFriendsClickedEvent:
        yield InviteFriends();
        break;
        case NavigationEvents.MembershipClickedEvent:
        yield Membership();
        break;
      case NavigationEvents.ProfileScreenClickedEvent:
        // TODO: Handle this case.
        break;
      case NavigationEvents.CoursesClickedEvent:
        // TODO: Handle this case.
        break;
  
    }
  }
}
