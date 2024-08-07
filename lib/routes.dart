import 'package:batwara/auth/auth.dart';
import 'package:batwara/buddies/buddies.dart';
import 'package:batwara/crews/crews.dart';
import 'package:batwara/feed/feed.dart';
import 'package:batwara/home/home.dart';
import 'package:batwara/profile/profile.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/crews': (context) => const CrewsScreen(),
  '/buddies': (context) => const BuddiesScreen(),
  '/feed': (context) => const FeedScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/auth': (context) => AuthScreen(),
};