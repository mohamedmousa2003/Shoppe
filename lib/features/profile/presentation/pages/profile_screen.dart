import 'package:e/features/auth/presentation/pages/login.dart';
import 'package:flutter/material.dart';

import '../../../../core/cache/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            // 1️⃣ Remove token
            await CacheHelper.removeData(
                'token'
            );

            // 2️⃣ Navigate to Login
            Navigator.pushNamedAndRemoveUntil(
              context,
              Login.routeName,
                  (route) => false, // remove all previous routes
            );
          },
          child: const Text(
            "Log Out",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
