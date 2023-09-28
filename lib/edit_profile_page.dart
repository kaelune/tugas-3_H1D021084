import 'package:flutter/material.dart';
import 'package:tugas_3_h1d021084/home_page.dart';
import 'package:tugas_3_h1d021084/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>{
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _usiaController = TextEditingController();

  void _saveprofile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('nama', _namaController.text);
    prefs.setString('nim', _nimController.text);
    prefs.setString('usia', _usiaController.text);
  }

  _showInput(namacontroller, placeholder){
    return TextField(
      controller: namacontroller,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }
  
  _showDialog(pesan, alamat){
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text(pesan),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => alamat,));
              },
            ) 
          ],
        );
      } 
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Edit profile'),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_namaController, 'Masukkan nama'),
            _showInput(_nimController, 'Masukkan nim'),
            _showInput(_usiaController, 'Masukkan usia'),
            ElevatedButton(
              child: const Text('Login'), 
              onPressed: (){
              if(_namaController.text != '' && 
                 _nimController.text != '' &&
                 _usiaController.text != ''){
                _saveprofile();
                _showDialog('Data anda telah dirubah', const HomePage());
              } else {
                _showDialog('Mohon isi data anda', const EditProfilePage());
              }
              }, 
            ),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}