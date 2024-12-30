import 'package:ecomanga/common/buttons/scale_button.dart';
import 'package:ecomanga/features/challenges/challenge_screen.dart';
import 'package:ecomanga/features/community/community_screen.dart';
import 'package:ecomanga/features/home/home_screen.dart';
import 'package:ecomanga/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({
    super.key,
  });

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> screenList = [
    const HomeScreen(),
    const ChallengeScreen(),
    const CommunityScreen(),
    const ProfileScreen(),
  ];
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ScaleButton(
                scale: .97,
                onTap: () {
                  setState(() {
                    currentScreen = const HomeScreen();
                    selectedIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.home,
                      color: selectedIndex == 0 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: selectedIndex == 0 ? Colors.blue : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              ScaleButton(
                scale: .97,
                onTap: () {
                  setState(() {
                    currentScreen = const ChallengeScreen();
                    selectedIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: selectedIndex == 1 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      "Attendence",
                      style: TextStyle(
                        color: selectedIndex == 1 ? Colors.blue : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              ScaleButton(
                scale: .97,
                onTap: () {
                  setState(() {
                    currentScreen = const CommunityScreen();
                    selectedIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: selectedIndex == 2 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: selectedIndex == 2 ? Colors.blue : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              ScaleButton(
                scale: .97,
                onTap: () {
                  setState(() {
                    currentScreen = const ProfileScreen();
                    selectedIndex = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.more_horiz,
                      color: selectedIndex == 3 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      "More",
                      style: TextStyle(
                        color: selectedIndex == 3 ? Colors.blue : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
