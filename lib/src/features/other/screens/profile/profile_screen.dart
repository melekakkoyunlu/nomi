import 'package:demo/src/features/authentication/controllers/profile_controller.dart';
import 'package:demo/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/text_strings.dart';
import '../../../../constants/sizes.dart';
import 'widgets/profile_menu.dart';
import 'package:demo/src/utils/theme/theme.dart';
import 'update_profile_screen.dart';
import 'package:get/get.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    controller.getUserData();

    int? selectedIndex;
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

                        borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage))),

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

                          barrierDismissible: true,
                          builder: (BuildContext context) {

                            return StatefulBuilder(
                              builder: (context, setStatePopup) {
                                return Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.9,
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
                                          "Make Your Choice",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        GridView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: 6,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 20,
                                          ),
                                          itemBuilder: (context, index) {
                                            final List<String> images = [
                                              tProfileImage1,
                                              tProfileImage2,
                                              tProfileImage3,
                                              tProfileImage4,
                                              tProfileImage5,
                                              tProfileImage6,
                                            ];
                                            selectedIndex = images.indexOf(tProfileImage);
                                            return GestureDetector(
                                              onTap: () {
                                                setStatePopup(() {
                                                  selectedIndex = index;
                                                });

                                                setState(() {
                                                  tProfileImage = images[index];
                                                });

                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: selectedIndex == index
                                                        ? Colors.red
                                                        : Colors.black,
                                                    width: 3,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(100),
                                                  child: Image.asset(
                                                    images[index],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),

                                        SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.redAccent,
                                          ),
                                          child: Text(
                                            "Close",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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

              FutureBuilder(
                  future: controller.getUserData(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                      if(snapshot.hasData) {
                        UserModel userData = snapshot.data as UserModel;
                        name = userData.fullName;
                        mail = userData.email;
                        number = userData.phoneNo;
                      }}
                        return Text(name, style: Theme.of(context).textTheme.headlineMedium);
                }
              ),

              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
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

                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Center(
                        child: Material(
                        color: Colors.transparent,

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

                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                            ),
                            SizedBox(height: 5),
                            ListTile(
                              title: const Text('Dark Mode'),
                              trailing: Switch(value: context.watch<NomiAppTheme>().themeMode == ThemeMode.dark, onChanged: (v) => context.read<NomiAppTheme>().toggleTheme()),
                            ),


                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"),
                            ),
                          ],
                        ),
                      ),


                        ), );

                  },
                );
              }),
              ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: () {
                showDialog(
                  context: context,

                  barrierDismissible: true,

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

                                  borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage(tProfileImage))),
                            ),
                            SizedBox(height: 10),
                            Text(
                              name,

                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(

                              mail,

                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(

                              number,

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
