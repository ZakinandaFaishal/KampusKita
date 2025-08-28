import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String _databaseName = 'mahasiswa_database.db';
  static const int _databaseVersion = 1;
  
  static const String _tableMahasiswa = 'mahasiswa';
  
  static Database? _database;

  // Singleton pattern
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inisialisasi database
  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // Membuat tabel
  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableMahasiswa (
        id TEXT PRIMARY KEY,
        nim TEXT UNIQUE NOT NULL,
        nama TEXT NOT NULL,
        tanggal_lahir TEXT NOT NULL,
        jenis_kelamin TEXT NOT NULL,
        alamat TEXT NOT NULL,
        prodi TEXT NOT NULL,
        email TEXT NOT NULL,
        notelp TEXT NOT NULL,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP,
        updated_at TEXT
      )
    ''');
  }

  // Model untuk data mahasiswa
  static Map<String, dynamic> createMahasiswaMap({
    required String nim,
    required String nama,
    required String tanggalLahir,
    required String jenisKelamin,
    required String alamat,
    required String prodi,
    required String email,
    required String notelp,
  }) {
    return {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'nim': nim,
      'nama': nama,
      'tanggal_lahir': tanggalLahir,
      'jenis_kelamin': jenisKelamin,
      'alamat': alamat,
      'prodi': prodi,
      'email': email,
      'notelp': notelp,
    };
  }

  // Simpan data mahasiswa baru
  static Future<bool> saveMahasiswa({
    required String nim,
    required String nama,
    required String tanggalLahir,
    required String jenisKelamin,
    required String alamat,
    required String prodi,
    required String email,
    required String notelp,
  }) async {
    try {
      final db = await database;
      
      // Cek apakah NIM sudah ada
      List<Map<String, dynamic>> existing = await db.query(
        _tableMahasiswa,
        where: 'nim = ?',
        whereArgs: [nim],
      );
      
      if (existing.isNotEmpty) {
        return false; // NIM sudah ada
      }
      
      // Buat data mahasiswa baru
      Map<String, dynamic> newMahasiswa = createMahasiswaMap(
        nim: nim,
        nama: nama,
        tanggalLahir: tanggalLahir,
        jenisKelamin: jenisKelamin,
        alamat: alamat,
        prodi: prodi,
        email: email,
        notelp: notelp,
      );
      
      // Insert ke database
      await db.insert(_tableMahasiswa, newMahasiswa);
      return true;
    } catch (e) {
      print('Error saving mahasiswa: $e');
      return false;
    }
  }

  // Ambil semua data mahasiswa
  static Future<List<Map<String, dynamic>>> getMahasiswaList() async {
    try {
      final db = await database;
      return await db.query(_tableMahasiswa, orderBy: 'created_at DESC');
    } catch (e) {
      print('Error getting mahasiswa list: $e');
      return [];
    }
  }

  // Hapus data mahasiswa berdasarkan ID
  static Future<bool> deleteMahasiswa(String id) async {
    try {
      final db = await database;
      int count = await db.delete(
        _tableMahasiswa,
        where: 'id = ?',
        whereArgs: [id],
      );
      return count > 0;
    } catch (e) {
      print('Error deleting mahasiswa: $e');
      return false;
    }
  }

  // Update data mahasiswa
  static Future<bool> updateMahasiswa({
    required String id,
    required String nim,
    required String nama,
    required String tanggalLahir,
    required String jenisKelamin,
    required String alamat,
    required String prodi,
    required String email,
    required String notelp,
  }) async {
    try {
      final db = await database;
      
      Map<String, dynamic> updatedData = {
        'nim': nim,
        'nama': nama,
        'tanggal_lahir': tanggalLahir,
        'jenis_kelamin': jenisKelamin,
        'alamat': alamat,
        'prodi': prodi,
        'email': email,
        'notelp': notelp,
        'updated_at': DateTime.now().toIso8601String(),
      };
      
      int count = await db.update(
        _tableMahasiswa,
        updatedData,
        where: 'id = ?',
        whereArgs: [id],
      );
      
      return count > 0;
    } catch (e) {
      print('Error updating mahasiswa: $e');
      return false;
    }
  }
}