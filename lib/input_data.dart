import 'package:flutter/material.dart';
import 'database.dart';

//prodi, email, notelp.

class InputData extends StatefulWidget {
  InputData({super.key});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final TextEditingController NIMcontroller = TextEditingController();
  final TextEditingController NamaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController prodiController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController notelpController = TextEditingController();

  String? selectedGender;
  Map<String, dynamic>? editData;
  bool isEditMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // ngecek apakah ada data yang dikirim dari halaman lain
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    
    if (args != null && !isEditMode) {
      editData = args;
      isEditMode = true;
      
      NIMcontroller.text = editData?['nim'] ?? '';
      NamaController.text = editData?['nama'] ?? '';
      alamatController.text = editData?['alamat'] ?? '';
      dateController.text = editData?['tanggal_lahir'] ?? '';
      selectedGender = editData?['jenis_kelamin'];
      prodiController.text = editData?['prodi'] ?? '';
      emailController.text = editData?['email'] ?? '';
      notelpController.text = editData?['notelp'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditMode ? 'Edit Data' : 'Input Data',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        ),
      backgroundColor: Colors.blue.shade50,
      body: Container(
        child: SafeArea(child: Padding(padding: EdgeInsets.only(left: 35.0, right: 35.0), 
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text('NIM', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 5),
                  TextField(
                  controller: NIMcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nomor Induk Mahasiswa',
                    labelStyle: TextStyle(color: const Color.fromARGB(50, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: 14),
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
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  ),
                  ),
                SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text('Nama', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 5),
                  TextField(
                    controller: NamaController,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      labelStyle: TextStyle(color: const Color.fromARGB(50, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: 14),
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ),
                  ),
                SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text('Tanggal Lahir', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    setState(() {
                    dateController.text = "${picked.day}/${picked.month}/${picked.year}";
                    });
                  }
                  },
                  child: AbsorbPointer(
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                    labelText: 'dd/mm/yyyy',
                    labelStyle: TextStyle(color: const Color.fromARGB(50, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: 14),
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
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                    ),
                  ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text('Jenis Kelamin', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Laki-laki', style: TextStyle(fontSize: 14)),
                        value: 'Laki-laki',
                        groupValue: selectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        activeColor: Colors.blue,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Perempuan', style: TextStyle(fontSize: 14)),
                        value: 'Perempuan',
                        groupValue: selectedGender,
                        onChanged: (String? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        activeColor: Colors.blue,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text('Alamat', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 5),
                  TextField(
                    controller: alamatController,
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      labelStyle: TextStyle(color: const Color.fromARGB(50, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: 14),
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ),
                  ),
                  SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text('Program Studi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 5),
                  TextField(
                    controller: prodiController,
                    decoration: InputDecoration(
                      labelText: 'Program Studi',
                      labelStyle: TextStyle(color: const Color.fromARGB(50, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: 14),
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ),
                  ),
                  SizedBox(height: 16.0),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text('Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 5),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: const Color.fromARGB(50, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: 14),
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text('No. Telp', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
                SizedBox(height: 5),
                  TextField(
                  controller: notelpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'No. Telp',
                    labelStyle: TextStyle(color: const Color.fromARGB(50, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: 14),
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
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  ),
                  ),
                SizedBox(height: 20.0),
                ElevatedButton(
                onPressed: () async {
                  if (NIMcontroller.text.isNotEmpty &&
                      NamaController.text.isNotEmpty &&
                      dateController.text.isNotEmpty &&
                      selectedGender != null &&
                      alamatController.text.isNotEmpty &&
                      prodiController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      notelpController.text.isNotEmpty) {

                    bool success;
                    
                    if (isEditMode && editData != null) {
                      // Mode edit
                      success = await DatabaseHelper.updateMahasiswa(
                        id: editData!['id'],
                        nim: NIMcontroller.text,
                        nama: NamaController.text,
                        tanggalLahir: dateController.text,
                        jenisKelamin: selectedGender!,
                        alamat: alamatController.text,
                        prodi: prodiController.text,
                        email: emailController.text,
                        notelp: notelpController.text,
                      );
                    } else {
                      // Mode tambah
                      success = await DatabaseHelper.saveMahasiswa(
                        nim: NIMcontroller.text,
                        nama: NamaController.text,
                        tanggalLahir: dateController.text,
                        jenisKelamin: selectedGender!,
                        alamat: alamatController.text,
                        prodi: prodiController.text,
                        email: emailController.text,
                        notelp: notelpController.text,
                      );
                    }

                    if (success) {
                      if (!isEditMode) {
                        NIMcontroller.clear();
                        NamaController.clear();
                        dateController.clear();
                        alamatController.clear();
                        prodiController.clear();
                        emailController.clear();
                        notelpController.clear();
                        setState(() {
                          selectedGender = null;
                        });
                      }
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(isEditMode ? 'Data berhasil diupdate' : 'Data berhasil disimpan'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      
                      // Jika mode edit, kembali ke halaman sebelumnya
                      if (isEditMode) {
                        Navigator.pop(context);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(isEditMode ? 'Gagal mengupdate data' : 'Gagal menyimpan data. NIM mungkin sudah ada.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Silahkan lengkapi semua field'),
                        backgroundColor: Colors.orange,
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
                child: Text(
                  isEditMode ? 'UPDATE' : 'SIMPAN', 
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
                ),
              ),
              SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
