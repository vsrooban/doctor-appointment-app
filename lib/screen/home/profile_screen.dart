import 'package:doctor_appointment_app/screen/home/favourite_screen.dart';
import 'package:doctor_appointment_app/screen/home/notification_screen.dart';
import 'package:doctor_appointment_app/screen/login/signin_screen.dart';
import 'package:doctor_appointment_app/util/custom_theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showLogoutDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Logout", style: AppTypography.h2),
              const SizedBox(height: 10),
              Divider(
              thickness: 1,
              color: const Color(0xFFE5E7EB),
            ),
              const SizedBox(height: 10),
              const Text(
                "Are you sure you want to log out?",
                style: AppTypography.bodyLG,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                    ),
                    child: Text("Cancel",
                        style:
                            AppTypography.bodyLG.copyWith(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SigninPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text("Yes, Logout",
                        style:
                            AppTypography.bodyLG.copyWith(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),
        Center(
          child: Text("Profile", style: AppTypography.h1),
        ),
        const SizedBox(height: 10),
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/profile-circle.png",
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 17,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xff1C2A3A)
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset('assets/images/pencil.png')
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 2),
        const Text("Daniel Martinez", style: AppTypography.h2),
        const Text("+123 856479683", style: AppTypography.bodySRegular),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              ProfileMenuItem(
                  icon: Image.asset("assets/images/user-edit.png"),
                  text: "Edit Profile"),
              Divider(
              thickness: 1,
              color: const Color(0xFFE5E7EB),
            ),
              ProfileMenuItem(
                icon: Image.asset("assets/images/favorite.png",width: 30,height: 30,),
                text: "Favorite",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavouriteScreen(),
                    ),
                  );
                },
              ),
              Divider(
              thickness: 1,
              color:  Color(0xFFE5E7EB),
            ),
              ProfileMenuItem(
                icon: Image.asset("assets/images/notification.png"),
                text: "Notifications",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen(
                            previousScreen: 'otherScreen')),
                  );
                },
              ),
               Divider(
              thickness: 1,
              color:  Color(0xFFE5E7EB),
            ),
              ProfileMenuItem(
                  icon: Image.asset("assets/images/setting-2.png"),
                  text: "Settings"),
               Divider(
              thickness: 1,
              color:  Color(0xFFE5E7EB),
            ),
              ProfileMenuItem(
                  icon: Image.asset("assets/images/message-question.png"),
                  text: "Help and Support"),
               Divider(
              thickness: 1,
              color: const Color(0xFFE5E7EB),
            ),
              ProfileMenuItem(
                  icon: Image.asset("assets/images/security-safe.png"),
                  text: "Terms and Conditions"),
             Divider(
              thickness: 1,
              color: const Color(0xFFE5E7EB),
            ), 
              ProfileMenuItem(
                icon: Image.asset("assets/images/logout.png"),
                text: "Log Out",
                showTrailingIcon: false,
                onTap: _showLogoutDialog,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final Widget icon;
  final String text;
  final bool showTrailingIcon;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.text,
    this.showTrailingIcon = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(text, style: AppTypography.bodyLG.copyWith(color: Color(0xff6B7280))),
      trailing: showTrailingIcon
          ? const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black54,
            )
          : null,
      onTap: onTap,
    );
  }
}
