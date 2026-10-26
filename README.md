# GymTrack

**GymTrack** adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu pengguna, khususnya pemula, mengenal berbagai pilihan latihan kebugaran dan memantau perkembangan aktivitas olahraga.

Aplikasi ini memiliki tampilan yang sederhana dan mudah digunakan. Pengguna dapat melihat rekomendasi latihan, mencari latihan berdasarkan nama, memfilter latihan berdasarkan tingkat kesulitan, melihat detail latihan, serta melihat statistik dan riwayat aktivitas melalui data dummy.

## Fitur Aplikasi

- **Home:** Menampilkan ringkasan aplikasi, statistik, dan rekomendasi latihan.
- **Workout:** Menampilkan daftar latihan, dilengkapi fitur pencarian dan filter tingkat kesulitan.
- **Detail Workout:** Menampilkan informasi latihan, durasi, perkiraan kalori, dan daftar gerakan.
- **Progress:** Menampilkan statistik, aktivitas mingguan, dan riwayat latihan simulasi.

## Teknologi yang Digunakan

- Flutter
- Dart
- Android Studio
- Android SDK

## Struktur Folder

```text
lib/
├── main.dart
├── models/
│   └── workout.dart
├── data/
│   └── dummy_workouts.dart
├── screens/
│   ├── main_shell.dart
│   ├── home_page.dart
│   ├── workout_page.dart
│   ├── workout_detail_page.dart
│   └── progress_page.dart
└── widgets/
    ├── stat_card.dart
    └── workout_tile.dart
```

## Cara Menjalankan Aplikasi

1. Buka proyek GymTrack di Android Studio atau Visual Studio Code.
2. Pastikan Flutter dan Android SDK sudah terpasang.
3. Buka terminal pada folder utama proyek.
4. Jalankan perintah berikut untuk mengunduh dependensi:

   ```bash
   flutter pub get
   ```

5. Hubungkan perangkat Android atau jalankan emulator.
6. Periksa perangkat yang tersedia:

   ```bash
   flutter devices
   ```

7. Jalankan aplikasi:

   ```bash
   flutter run
   ```

8. Jika ingin memeriksa kode program, jalankan:

   ```bash
   flutter analyze
   ```

## Catatan

GymTrack saat ini menggunakan data dummy yang ditulis langsung di dalam kode program. Data statistik dan riwayat latihan belum disimpan secara permanen. Tombol Mulai Sesi Latihan menampilkan dialog konfirmasi dan notifikasi, tetapi belum menjalankan pencatatan aktivitas secara otomatis.

## Pengembang

- **Nama:** Narendra Rafi Firdousi
- **NIM:** 240605110237
- **Mata Kuliah:** Mobile Programming Praktikum 'K'
