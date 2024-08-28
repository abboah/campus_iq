import 'package:campus_iq/core/errors/usecases/use_case_provider.dart';
import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:campus_iq/courses_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

import '../core/widgets/drawer.dart';
import '../schedule_widget.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey =
        GlobalKey<ScaffoldState>();
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    final logout = ref.watch(logoutUseCaseProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // bottomNavigationBar: const BottomNavBarFb2(),
        endDrawer: Drawer(
            width: MediaQuery.of(context).size.width / 1.5,
            child: const MainDrawer()),
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ExtraColors.transparent,
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage('assets/images/Profile image.png'),
            ),
          ),
          forceMaterialTransparency: false,
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(right: 20.0),
              hoverColor: ExtraColors.transparent,
              highlightColor: ExtraColors.transparent,
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
              icon: Icon(IconlyLight.category,
                  color: isLightTheme ? ExtraColors.black : ExtraColors.white),
            ),
          ],
        ),
        // body: Center(
        //   child:
        //       // Container(),
        //       ElevatedButton(
        //           onPressed: () async {
        //             // Navigator.pushNamed(context, OTPScreen.routeName);
        //             try {
        //               final message = await logout(NoParams());
        //               ScaffoldMessenger.of(context).showSnackBar(
        //                   const SnackBar(content: Text('Logout Successful')));
        //               Navigator.pushNamed(context, SignInScreen.routeName);
        //             } catch (error) {
        //               ScaffoldMessenger.of(context).showSnackBar(
        //                   SnackBar(content: Text('Error: ${error.toString()}')));
        //               print(Text('Error: ${error.toString()}'));
        //               // Handle error
        //             }
        //           },
        //           child: const Text(
        //             "logout",
        //             style: TextStyle(color: Colors.black),
        //           )),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Hello, ',
                      style: textTheme.headlineMedium!.copyWith(
                          color: isLightTheme
                              ? ExtraColors.black
                              : ExtraColors.white),
                    ),
                    TextSpan(
                      text: 'John',
                      style: textTheme.headlineLarge!.copyWith(
                          color: isLightTheme
                              ? ExtraColors.black
                              : ExtraColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TabBar(
                tabs: const [
                  Tab(
                    text: 'Schedule',
                  ),
                  Tab(
                    text: 'Courses',
                  ),
                ],
                labelStyle: textTheme.bodyLarge,
                unselectedLabelColor:
                    isLightTheme ? ExtraColors.black : ExtraColors.white,
                labelColor:
                    isLightTheme ? ExtraColors.black : ExtraColors.white,
                indicatorColor: ExtraColors.buttonOutline,
                dividerColor: ExtraColors.transparent,
              ),
              Expanded(
                  child: TabBarView(children: [
                // ScheduleTab(),
                Container(
                    child: TableEventsExample(
                  color: isLightTheme ? ExtraColors.black : ExtraColors.white,
                )),
                // CoursesTab(),
                Container(
                    child: CoursesTabWidget(
                  color: isLightTheme ? ExtraColors.black : ExtraColors.white,
                  textStyle: textTheme.bodyLarge?.copyWith(fontSize: 18),
                )),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
