import 'package:campus_iq/core/errors/usecases/no_params.dart';
import 'package:campus_iq/core/errors/usecases/use_case_provider.dart';
import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:campus_iq/features/authentication/presentation/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

import '../core/widgets/bottom_navbar.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    final logout = ref.watch(logoutUseCaseProvider);
    return Scaffold(
      // bottomNavigationBar: const BottomNavBarFb2(),
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: ExtraColors.black,
          ),
        ),
        forceMaterialTransparency: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(IconlyLight.category))
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
                    style: textTheme.headlineMedium!
                        .copyWith(color: ExtraColors.black),
                  ),
                  TextSpan(
                    text: 'John',
                    style: textTheme.headlineLarge!.copyWith(
                        color: ExtraColors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            TabBar(tabs: [])
          ],
        ),
      ),
    );
  }
}
