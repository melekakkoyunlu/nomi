import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/text_strings.dart';
import '../../../../constants/sizes.dart';
import 'widgets/profile_menu.dart';
import 'package:demo/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'update_profile_screen.dart';
import 'package:get/get.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile, style: Theme.of(context).textTheme.headlineMedium),
        actions: [IconButton(onPressed: () {}, icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [

              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage2))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
                      child: IconButton(onPressed: (){
                        showDialog(
                          context: context,
                          barrierDismissible: true, // Tıklayınca kapatılabilir
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Modern Popup",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Bu, tamamen özelleştirilmiş bir popup.",
                                      textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(

                                          width: 120,
                                          height: 120,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage1))),
                                        ),
                                        SizedBox(width: 20),
                                        SizedBox(
                                          width: 120,
                                          height: 120,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage2))),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(

                                          width: 120,
                                          height: 120,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage3))),
                                        ),
                                        SizedBox(width: 20),
                                        SizedBox(
                                          width: 120,
                                          height: 120,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage4))),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(

                                          width: 120,
                                          height: 120,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage5))),
                                        ),
                                        SizedBox(width: 20),
                                        SizedBox(
                                          width: 120,
                                          height: 120,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage6))),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Kapat"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }, icon: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),)

                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(tProfileHeading, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor, side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: () {
                showDialog(
                  context: context,
                  barrierDismissible: true, // Tıklayınca kapatılabilir
                  builder: (BuildContext context) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Settings",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text('Dark Mode'),
                                trailing: Switch(value: true, onChanged: (v){}),
                              ),
                            ],
                          ),

                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
              ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {
                showDialog(
                  context: context,
                  barrierDismissible: true, // Tıklayınca kapatılabilir
                  builder: (BuildContext context) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage1))),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Nomi Nomi",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "nomi@nomi.com",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "+9055555555555",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: (){
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () => AuthenticationRepository.instance.logout(),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
