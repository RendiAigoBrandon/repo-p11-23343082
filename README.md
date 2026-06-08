# repo-p11-23343082

## Aktivitas Digital Nomad - Pertemuan 11

### Kolaborasi Tim Virtual: Implementasi Repository Pattern di GitHub

Repository ini dibuat untuk memenuhi tugas Pertemuan 11 mata kuliah **Mobile Programming Lanjutan**. Project ini mengimplementasikan **Repository Pattern** pada aplikasi Flutter untuk memisahkan logika pengambilan data, penyimpanan data lokal, konfigurasi API, dan tampilan aplikasi.

Repository Pattern digunakan agar kode lebih rapi, mudah diuji, mudah dikembangkan, dan cocok untuk pengerjaan secara tim menggunakan GitHub.

---

## Identitas Project

| Keterangan          | Isi                                                               |
| ------------------- | ----------------------------------------------------------------- |
| Nama Repository     | repo-p11-23343082                                                 |
| Ketua Tim           | Rendi Aigo Brandon                                                |
| NIM Ketua           | 23343082                                                          |
| Anggota Tim         | Muhammad Rafki                                                    |
| NIM Anggota         | 23343078                                                          |
| Framework           | Flutter                                                           |
| Pattern             | Repository Pattern                                                |
| Platform Kolaborasi | GitHub                                                            |
| Tools Kolaborasi    | GitHub Issues, GitHub Projects, Branch, Pull Request, Code Review |

---

## Alasan Pemilihan Repository Pattern

Repository Pattern dipilih karena dapat memisahkan tanggung jawab antara **presentation layer**, **repository**, **data source**, dan **service layer**. Dengan pola ini, tampilan aplikasi tidak langsung memanggil API atau penyimpanan lokal, tetapi melalui repository sebagai perantara.

Beberapa alasan penggunaan Repository Pattern adalah:

1. **Separation of Concerns**
   Logika tampilan, pengambilan data API, penyimpanan lokal, dan autentikasi dipisahkan ke dalam bagian masing-masing.

2. **Maintainability**
   Kode lebih mudah dirawat karena setiap file memiliki tanggung jawab yang jelas.

3. **Testability**
   Repository dan data source lebih mudah diuji karena tidak bergantung langsung pada UI.

4. **Flexibility**
   Sumber data dapat diganti, misalnya dari REST API ke local database, tanpa mengubah presentation layer secara besar.

5. **Collaboration Friendly**
   Setiap anggota tim dapat mengerjakan komponen berbeda, seperti Remote Data Source, Local Data Source, Repository Implementation, dan Dio Auth Interceptor.

---

## Struktur Project

```text
lib/
├── data/
│   ├── datasources/
│   │   ├── remote_data_source.dart
│   │   ├── local_data_source.dart
│   │   └── dio_auth_interceptor.dart
│   ├── models/
│   │   └── product_model.dart
│   └── repositories/
│       └── repository_impl.dart
│
├── domain/
│   ├── entities/
│   │   └── product_entity.dart
│   ├── repositories/
│   │   └── repository.dart
│   └── usecases/
│       └── get_products_usecase.dart
│
└── presentation/
    ├── pages/
    │   └── product_page.dart
    └── widgets/
        └── product_card.dart
```

---

## Diagram Interaksi Komponen

```text
┌──────────────────────────────────────────────┐
│              Presentation Layer              │
│              Pages / Widgets                 │
└──────────────────────┬───────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────┐
│                Domain Layer                  │
│        Repository Interface / Use Case       │
└──────────────────────┬───────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────┐
│                 Data Layer                   │
│          Repository Implementation           │
└───────────────┬──────────────────────┬───────┘
                │                      │
                ▼                      ▼
┌──────────────────────────┐  ┌──────────────────────────┐
│   Remote Data Source     │  │    Local Data Source     │
│   Dio + REST API         │  │    Secure Storage/Cache  │
└───────────────┬──────────┘  └───────────────┬──────────┘
                │                             │
                ▼                             ▼
┌──────────────────────────┐  ┌──────────────────────────┐
│      Dio Interceptor     │  │       Local Storage      │
│   Token Authentication   │  │       Cached Data        │
└──────────────────────────┘  └──────────────────────────┘
```

---

## Alur Kerja Repository Pattern

Alur kerja Repository Pattern pada project ini adalah sebagai berikut:

1. User membuka halaman pada presentation layer.
2. Presentation layer meminta data melalui repository.
3. Repository interface menjadi kontrak yang digunakan oleh layer atas.
4. Repository implementation mengatur sumber data yang akan digunakan.
5. Jika data berasal dari server, repository memanggil remote data source.
6. Remote data source melakukan request API menggunakan Dio.
7. Dio Auth Interceptor menambahkan token autentikasi jika diperlukan.
8. Jika data berhasil diambil, data dapat disimpan ke local data source sebagai cache.
9. Jika request API gagal, repository dapat mengambil data dari local data source.
10. Data dikembalikan ke presentation layer untuk ditampilkan kepada pengguna.

---

## Komponen yang Diimplementasikan

| No | Komponen                  | Tanggung Jawab                                                |
| -- | ------------------------- | ------------------------------------------------------------- |
| 1  | Remote Data Source        | Mengambil data dari REST API menggunakan Dio                  |
| 2  | Local Data Source         | Menyimpan dan mengambil data lokal atau cache                 |
| 3  | Repository Interface      | Menjadi kontrak abstrak untuk operasi data                    |
| 4  | Repository Implementation | Mengatur alur data antara remote dan local data source        |
| 5  | Dio Auth Interceptor      | Menambahkan token autentikasi dan menangani error autentikasi |
| 6  | Token Storage             | Menyimpan token secara aman                                   |
| 7  | Model                     | Merepresentasikan response data dari API                      |
| 8  | Presentation Layer        | Menampilkan data kepada pengguna                              |

---

## Dependencies

Dependencies utama yang digunakan:

```yaml
dependencies:
  dio: ^5.9.2
  flutter_secure_storage: ^10.3.1
```

Keterangan:

* `dio` digunakan sebagai HTTP client untuk melakukan request ke REST API.
* `flutter_secure_storage` digunakan untuk menyimpan token secara aman di perangkat.

---

## Panduan Setup Project

### 1. Clone Repository

```bash
git clone https://github.com/RendiAigoBrandon/repo-p11-23343082.git
```

### 2. Masuk ke Folder Project

```bash
cd repo-p11-23343082
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Jalankan Project

```bash
flutter run
```

---

## Pembagian Peran Anggota Tim

| No | Nama Anggota       | NIM      | Peran                                                           | Tugas                                                                                                                                                                        |
| -- | ------------------ | -------- | --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1  | Rendi Aigo Brandon | 23343082 | Project Leader, Repository Interface, Repository Implementation | Membuat struktur folder Repository Pattern, ProductModel, Repository Interface, Repository Implementation, menghubungkan Repository ke UI, dan melakukan review Pull Request |
| 2  | Muhammad Rafki     | 23343078 | Remote Data Source, Local Data Source, Dio Auth Interceptor     | Mengimplementasikan Remote Data Source, Local Data Source, Token Storage, Dio Service, Dio Auth Interceptor, serta memberikan komentar konstruktif pada repository tim lain  |

---

## Branch yang Digunakan

Setiap anggota bekerja pada branch masing-masing agar kontribusi terlihat pada commit history dan Pull Request.

| Branch                             | Penanggung Jawab   | Komponen yang Dikerjakan                                                                        |
| ---------------------------------- | ------------------ | ----------------------------------------------------------------------------------------------- |
| `feature/project-setup-repository` | Rendi Aigo Brandon | Struktur folder, ProductModel, Repository Interface, Repository Implementation, integrasi ke UI |
| `feature/data-source-interceptor`  | Muhammad Rafki     | Remote Data Source, Local Data Source, Token Storage, Dio Service, Dio Auth Interceptor         |

---

## Aturan Pull Request

Setiap perubahan tidak langsung dimasukkan ke branch `main`, tetapi melalui Pull Request.

Aturan Pull Request:

1. Setiap anggota membuat branch sesuai tugas masing-masing.
2. Perubahan dilakukan pada branch fitur.
3. Setelah selesai, anggota membuat Pull Request ke branch `main`.
4. Pull Request harus berisi deskripsi pekerjaan yang dilakukan.
5. Pull Request wajib direview minimal oleh satu anggota lain.
6. Pull Request baru boleh di-merge setelah direview.
7. Setelah merge, branch fitur dapat dihapus.

---

## Daftar Pull Request

| No | Pull Request                                                               | Branch                             | Pembuat PR         | Reviewer           | Status |
| -- | -------------------------------------------------------------------------- | ---------------------------------- | ------------------ | ------------------ | ------ |
| 1  | Implementasi struktur Repository Pattern dan Repository Implementation     | `feature/project-setup-repository` | Rendi Aigo Brandon | Muhammad Rafki     | Done   |
| 2  | Implementasi Data Source, Token Storage, Dio Service, dan Auth Interceptor | `feature/data-source-interceptor`  | Muhammad Rafki     | Rendi Aigo Brandon | Done   |

---

## GitHub Issues

GitHub Issues digunakan sebagai daftar pekerjaan resmi dalam project. Setiap komponen dibuat sebagai issue dan di-assign kepada anggota yang bertanggung jawab.

| No | Judul Issue                                              | Assignee           | Status |
| -- | -------------------------------------------------------- | ------------------ | ------ |
| 1  | Membuat struktur folder Repository Pattern               | Rendi Aigo Brandon | Done   |
| 2  | Membuat ProductModel                                     | Rendi Aigo Brandon | Done   |
| 3  | Membuat Repository Interface                             | Rendi Aigo Brandon | Done   |
| 4  | Membuat Repository Implementation                        | Rendi Aigo Brandon | Done   |
| 5  | Menghubungkan Repository ke UI pada main.dart            | Rendi Aigo Brandon | Done   |
| 6  | Implementasi Remote Data Source                          | Muhammad Rafki     | Done   |
| 7  | Implementasi Local Data Source                           | Muhammad Rafki     | Done   |
| 8  | Implementasi Token Storage                               | Muhammad Rafki     | Done   |
| 9  | Implementasi Dio Auth Interceptor                        | Muhammad Rafki     | Done   |
| 10 | Implementasi Dio Service                                 | Muhammad Rafki     | Done   |
| 11 | Review Pull Request anggota tim                          | Rendi Aigo Brandon | Done   |
| 12 | Memberikan komentar konstruktif pada repository tim lain | Muhammad Rafki     | Done   |

---

## GitHub Projects Workflow

Project dikelola menggunakan GitHub Projects dengan alur:

```text
To Do → In Progress → Review → Done
```

Penjelasan:

| Kolom       | Fungsi                                                 |
| ----------- | ------------------------------------------------------ |
| To Do       | Berisi daftar tugas yang belum dikerjakan              |
| In Progress | Berisi tugas yang sedang dikerjakan                    |
| Review      | Berisi tugas yang sudah selesai tetapi perlu diperiksa |
| Done        | Berisi tugas yang sudah selesai dan sudah direview     |

---

## Review Repository Tim Lain

Sebagai bagian dari tugas, tim juga mengunjungi repository kelompok lain dan memberikan komentar konstruktif melalui GitHub Issues.

Format komentar yang diberikan:

### Satu Hal yang Sudah Baik

```text
Struktur Repository Pattern sudah cukup jelas karena komponen seperti Remote Data Source, Local Data Source, Repository Implementation, dan service sudah dipisahkan. Hal ini membuat kode lebih mudah dipahami dan dikembangkan.
```

### Satu Saran Perbaikan Konkret

```text
README sebaiknya ditambahkan diagram alur interaksi komponen agar pembaca lebih mudah memahami hubungan antara UI, Repository, Remote Data Source, Local Data Source, dan API Service.
```

---

## Workflow Tim

Workflow pengerjaan project:

1. Membuat repository GitHub.
2. Membuat struktur folder Repository Pattern.
3. Membuat branch masing-masing anggota.
4. Membuat GitHub Issues untuk setiap komponen.
5. Mengerjakan tugas sesuai branch masing-masing.
6. Membuat Pull Request.
7. Melakukan code review.
8. Merge Pull Request ke branch `main`.
9. Memberikan komentar konstruktif pada repository tim lain.
10. Mengumpulkan link repository.

---

## Contoh Perintah Git

### Membuat Branch Rendi

```bash
git checkout -b feature/project-setup-repository
git push -u origin feature/project-setup-repository
```

### Membuat Branch Rafki

```bash
git checkout -b feature/data-source-interceptor
git push -u origin feature/data-source-interceptor
```

### Commit Perubahan

```bash
git add .
git commit -m "feat: implement repository pattern component"
git push
```

---

## Catatan Penting

* Jangan push langsung ke branch `main`.
* Gunakan branch sesuai tugas masing-masing.
* Pull Request harus direview sebelum di-merge.
* Commit message harus jelas dan deskriptif.
* Setiap issue harus memiliki assignee.
* Kontribusi anggota harus terlihat pada commit history dan Pull Request.
* Dokumentasi perlu diperbarui jika ada perubahan struktur project.

---

## Resources

* [Flutter Documentation](https://docs.flutter.dev/)
* [Dio Package](https://pub.dev/packages/dio)
* [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)
* [Repository Pattern Flutter](https://resocoder.com/flutter-clean-architecture)

---

## Repository

**Link Repository:**
https://github.com/RendiAigoBrandon/repo-p11-23343082

**Last Updated:** 2026-06-08
