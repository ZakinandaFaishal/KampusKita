import 'package:flutter/material.dart';
import 'database.dart';

class ViewDataPage extends StatefulWidget {
  const ViewDataPage({super.key});

  @override
  State<ViewDataPage> createState() => _ViewDataPageState();
}

class _ViewDataPageState extends State<ViewDataPage> {
  List<Map<String, dynamic>> mahasiswaList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });
    
    List<Map<String, dynamic>> data = await DatabaseHelper.getMahasiswaList();
    
    setState(() {
      mahasiswaList = data;
      isLoading = false;
    });
  }

  Future<void> deleteData(String id) async {
    bool success = await DatabaseHelper.deleteMahasiswa(id);
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data berhasil dihapus'),
          backgroundColor: Colors.green,
        ),
      );
      loadData(); // Refresh data
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menghapus data'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showOptionsBottomSheet(BuildContext context, Map<String, dynamic> mahasiswa) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 20),
              Text(
                mahasiswa['nama'],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
                Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.visibility, color: Colors.blue),
                  title: Text('Lihat Data'),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                  Navigator.pop(context);
                  _showDetailDialog(context, mahasiswa);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.edit, color: Colors.orange),
                  title: Text('Edit Data'),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _navigateToEditData(mahasiswa);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text('Hapus Data'),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _showDeleteConfirmation(context, mahasiswa);
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showDetailDialog(BuildContext context, Map<String, dynamic> mahasiswa) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Detail Mahasiswa',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
                _buildDetailRow('Nama', mahasiswa['nama']),
                Divider(color: Colors.grey[300], thickness: 0.5),
                _buildDetailRow('NIM', mahasiswa['nim']),
                Divider(color: Colors.grey[300], thickness: 0.5),
                _buildDetailRow('Tgl. Lahir', mahasiswa['tanggal_lahir']),
                Divider(color: Colors.grey[300], thickness: 0.5),
                _buildDetailRow('Gender', mahasiswa['jenis_kelamin']),
                Divider(color: Colors.grey[300], thickness: 0.5),
                _buildDetailRow('Alamat', mahasiswa['alamat']),
                Divider(color: Colors.grey[300], thickness: 0.5),
                _buildDetailRow('Prodi', mahasiswa['prodi']),
                Divider(color: Colors.grey[300], thickness: 0.5),
                _buildDetailRow('Email', mahasiswa['email']),
                Divider(color: Colors.grey[300], thickness: 0.5),
                _buildDetailRow('No. Telepon', mahasiswa['notelp']),
              SizedBox(height: 20),
                SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  ),
                  child: Text('Tutup'),
                  onPressed: () {
                  Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value ?? 'Tidak tersedia'),
          ),
        ],
      ),
    );
  }

  void _navigateToEditData(Map<String, dynamic> mahasiswa) {
    Navigator.pushNamed(
      context,
      '/input_data',
      arguments: mahasiswa,
    ).then((_) {
      // Refresh data setelah kembali dari halaman edit
      loadData();
    });
  }

  void _showDeleteConfirmation(BuildContext context, Map<String, dynamic> mahasiswa) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text(
            'Apakah Anda yakin ingin menghapus data ${mahasiswa['nama']}?'),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Hapus'),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop();
                deleteData(mahasiswa['id']);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Mahasiswa',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.blue.shade50,
      body: RefreshIndicator(
        onRefresh: loadData,
        child: isLoading
        ? Center(child: CircularProgressIndicator())
        : mahasiswaList.isEmpty
            ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Icon(
              Icons.inbox,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Belum ada data mahasiswa',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
              ],
            ),
          )
            : ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: mahasiswaList.length,
            itemBuilder: (context, index) {
              final mahasiswa = mahasiswaList[index];
              return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue.shade200,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      mahasiswa['jenis_kelamin'] == 'Laki-laki' 
                        ? 'assets/boy.png' 
                        : 'assets/girl.png'
                    ),
                  ),
                ),
                title: Text(
                  mahasiswa['nama'] ?? 'Nama tidak tersedia',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      mahasiswa['nim'] ?? 'NIM tidak tersedia',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue.shade600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      mahasiswa['prodi'] ?? 'Prodi tidak tersedia',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.more_vert,
                    size: 16,
                    color: Colors.blue.shade600,
                  ),
                ),
                onTap: () {
                  _showOptionsBottomSheet(context, mahasiswa);
                },
              ),
            ),
          );
        },
      ),
      )
    );
  }
}
