import 'package:flutter/material.dart';
import 'package:tugas_3_h1d021084/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var namauser;

  void _saveusername() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  } 

  _showInput(namacontroller, placeholder, isPassword){
    return TextField(
      controller: namacontroller,
      obscureText: isPassword,
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
      appBar: AppBar(title: const Text('Login'),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_usernameController, 'Masukkan username', false),
            _showInput(_passwordController, 'Masukkan password', true),
            ElevatedButton(
              child: const Text('Login'), 
              onPressed: (){
              if(_usernameController.text == 'Pilar' && 
                 _passwordController.text == 'kaelune'){
                _saveusername();
                _showDialog('Selamat datang, anda berhasil login sebagai Pilar Filino Hadi', const HomePage());
              } else {
                _showDialog('Anda gagal login, username dan password tidak sesuai', const LoginPage());
              }
              }, 
            ),
          ],
        ),
      ),
    );
  }
}






