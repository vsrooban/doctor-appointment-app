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
              Divider(thickness: 1, color: Colors.grey),
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
        const SizedBox(height: 10),
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
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 16,
                  ),
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
              const ProfileMenuItem(
                  icon: Icons.person_2_outlined, text: "Edit Profile"),
              const Divider(),
              ProfileMenuItem(
                icon: Icons.favorite_border,
                text: "Favorite",
                // onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => FavouriteScreen(),
                //   ),
                // );
                // },
              ),
              const Divider(),
              ProfileMenuItem(
                icon: Icons.notifications_none,
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
              const Divider(),
              const ProfileMenuItem(
                  icon: Icons.settings_outlined, text: "Settings"),
              const Divider(),
              const ProfileMenuItem(
                  icon: Icons.help_outline_sharp, text: "Help and Support"),
              const Divider(),
              const ProfileMenuItem(
                  icon: Icons.description_outlined,
                  text: "Terms and Conditions"),
              const Divider(),
              ProfileMenuItem(
                icon: Icons.logout_outlined,
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
  final IconData icon;
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
      leading: Icon(icon, color: Colors.black54),
      title: Text(text, style: AppTypography.bodyLG),
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
