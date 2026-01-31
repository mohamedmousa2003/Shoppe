import 'package:e/features/auth/presentation/pages/login.dart';
import 'package:flutter/material.dart';

import '../../../../core/cache/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:Text("Mohamed Mousa",style: TextStyle(color: Colors.red,fontSize: 30),)
      ),
    );
  }
}
