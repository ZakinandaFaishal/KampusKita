import 'package:bnsp/about.dart';
import 'package:bnsp/input_data.dart';
import 'package:bnsp/list_data.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 16.0),
          child: Text(
            'Dashboard',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
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
                      child: Image.asset(
                        'assets/mahasiswa.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                    SizedBox(height: 55.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ViewDataPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          backgroundColor: Colors.deepOrange,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/archieve.png',
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'LIHAT DATA',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => InputData()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          backgroundColor: Colors.blue.shade700,
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/new.png',
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'INPUT DATA',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => AboutPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          backgroundColor: const Color.fromARGB(255, 255, 177, 59),
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                                ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                                child: Image.asset(
                                  'assets/info.png',
                                  width: 35,
                                  height: 35,
                                ),
                                ),
                              SizedBox(width: 20),
                              Text(
                                'INFORMASI',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
