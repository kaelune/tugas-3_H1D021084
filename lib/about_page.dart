import 'package:flutter/material.dart';
import 'package:tugas_3_h1d021084/sidemenu.dart';

class AboutPage extends StatefulWidget{
  const AboutPage ({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('About page'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Halaman ini adalah halaman about. Aplikasi ini dibuat untuk memenuhi tugas pertemuan ke-3 praktikum mobile')
          ],
        ),
        
      ),
      drawer: const Sidemenu(),
    );
  }
}