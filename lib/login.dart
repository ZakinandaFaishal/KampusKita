import 'package:bnsp/dashboard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 16.0),
          child: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      backgroundColor: Colors.blue.shade50,
      body: Container(
        child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 35.0, right: 35.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                child: Image.asset('assets/mahasiswa.png', width: 100.0, height: 100.0),
              ),
              SizedBox(height: 55.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: const Color.fromARGB(115, 0, 0, 0), fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
                SizedBox(height: 16.0),
                TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: const Color.fromARGB(115, 0, 0, 0), fontWeight: FontWeight.w500),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;
                    if (email.isNotEmpty && password.isNotEmpty) {
                      if (email == 'admin' && password == 'jmp') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login berhasil'), backgroundColor: Colors.green,),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Email atau kata sandi salah'), backgroundColor: Colors.red,),
                        );
                      }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.white),
                            children: [
                              TextSpan(text: 'Silahkan masukkan email dan kata sandi. \n'),
                              TextSpan(text: 'Email: admin, Password: jmp', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade200)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      ),
      ),
      ),
    );
  }
}