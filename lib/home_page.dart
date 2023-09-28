import 'package:flutter/material.dart';
import 'package:tugas_3_h1d021084/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{
  const HomePage ({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  var namauser;
  var nama;
  var nim;
  var usia;
  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');

    setState(() {});
  }

  void _loadprofile() async{
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nama = prefs.getString('nama');
    nim = prefs.getString('nim');
    usia = prefs.getString('usia');
        
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    _loadUsername();
    _loadprofile();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Card(
        margin: EdgeInsets.all(15),
        
        child: Column(
          children: [
            Text('Selamat datang, $namauser'),
            const Divider(),
            Text('Anda bernama $nama, dengan NIM $nim dan berusia $usia.'),
            const Divider(),
            Text('Untuk mengubah data ini dapat mengunjungi halaman edit profile pada sidemenu'),
          ],
        )
  
      ),
      drawer: const Sidemenu(),
    );    
  }
}