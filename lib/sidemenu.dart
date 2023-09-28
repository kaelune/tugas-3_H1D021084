import 'package:flutter/material.dart';
import 'package:tugas_3_h1d021084/about_page.dart';
import 'package:tugas_3_h1d021084/home_page.dart';
import 'package:tugas_3_h1d021084/edit_profile_page.dart';
import 'package:tugas_3_h1d021084/login_page.dart';

class Sidemenu extends StatelessWidget{
  const Sidemenu ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Application'),),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.people_sharp),
            title: const Text('Edit Profile'),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}