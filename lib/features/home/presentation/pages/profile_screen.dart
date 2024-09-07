import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:campus_iq/features/upload_docs/presentation/pages/upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ExtraColors.buttonOutline,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: textTheme.headlineSmall?.copyWith(
              color: isLightTheme ? ExtraColors.white : ExtraColors.black),
        ),
        backgroundColor: ExtraColors.transparent,
        centerTitle: true,
        leading: IconButton(
            color: isLightTheme ? ExtraColors.white : ExtraColors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 10,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 12),
              decoration: BoxDecoration(
                  color: isLightTheme ? ExtraColors.white : ExtraColors.black,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'John Doe',
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        color: ExtraColors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: const Text('johndoe2@email.com'),
                  ),
                  Card(
                    margin: const EdgeInsets.all(15.0),
                    elevation: 2.5,
                    surfaceTintColor: Colors.white38,
                    shadowColor: ExtraColors.grey,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          color: isLightTheme
                              ? ExtraColors.white
                              : ExtraColors.black,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: ExtraColors.grey)),
                      child: ListTile(
                        leading: const Icon(
                          IconlyLight.calendar,
                          color: ExtraColors.buttonOutline,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, UploadScanScreen.routeName);
                        },
                        title: const Text('Schedule Configurations'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(IconlyLight.edit),
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    leading: Icon(IconlyLight.setting),
                    title: Text('Settings'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    leading: Icon(IconlyLight.info_circle),
                    title: Text('About'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    leading: Icon(
                      IconlyLight.logout,
                      color: Colors.redAccent,
                    ),
                    title: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 10,
            child: Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/Profile image.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
