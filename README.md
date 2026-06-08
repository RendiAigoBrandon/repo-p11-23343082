# Repository Pattern Project - P11

Proyek Flutter yang mengimplementasikan **Repository Pattern** untuk memisahkan logic data fetching dari presentation layer.

## 📋 Alasan Pemilihan Repository Pattern

Repository Pattern dipilih karena memberikan beberapa keuntungan:

1. **Separation of Concerns**: Memisahkan data access logic dari business logic
2. **Testability**: Memudahkan unit testing dengan dependency injection
3. **Flexibility**: Mudah untuk mengganti data source (API, Local DB, Cache)
4. **Single Responsibility**: Setiap layer memiliki tanggung jawab spesifik
5. **Reusability**: Komponen dapat digunakan kembali di berbagai bagian aplikasi

## 🏗️ Struktur Proyek

```
lib/
├── data/
│   ├── datasources/
│   │   ├── remote_data_source.dart      (API calls)
│   │   ├── local_data_source.dart       (Secure Storage)
│   │   └── dio_auth_interceptor.dart    (Authentication)
│   ├── models/
│   │   └── (Data models dari API responses)
│   └── repositories/
│       └── repository_impl.dart         (Implementation logic)
├── domain/
│   ├── entities/
│   │   └── (Business entities)
│   ├── repositories/
│   │   └── repository.dart              (Abstract repository)
│   └── usecases/
│       └── (Business logic)
└── presentation/
    └── (UI layer - pages, widgets)
```

## 📊 Diagram Interaksi Komponen

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                       │
│                   (Pages & Widgets)                          │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                     DOMAIN LAYER                            │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Abstract Repository Interface                       │   │
│  └──────────────────────────────────────────────────────┘   │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ↓
┌─────────────────────────────────────────────────────────────┐
│                     DATA LAYER                              │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  Repository Implementation                           │   │
│  │  (Business logic untuk data management)              │   │
│  └──────────┬─────────────────────┬────────────────────┘   │
│             │                     │                         │
│             ↓                     ↓                         │
│  ┌──────────────────────┐  ┌──────────────────────┐        │
│  │ Remote Data Source   │  │ Local Data Source    │        │
│  │ (Dio + API)          │  │ (Secure Storage)     │        │
│  │ + Auth Interceptor   │  │ (Encryption)         │        │
│  └──────────────────────┘  └──────────────────────┘        │
└─────────────────────────────────────────────────────────────┘
                         │
           ┌─────────────┴─────────────┐
           ↓                           ↓
    ┌─────────────┐            ┌─────────────┐
    │  REST API   │            │ Secure DB   │
    └─────────────┘            └─────────────┘
```

## 🛠️ Setup Panduan

### Prerequisites
- Flutter SDK 3.0+
- Dart 3.0+
- Git

### Instalasi

1. **Clone repository**
   ```bash
   git clone https://github.com/RendiAigoBrandon/repo-p11-23343082.git
   cd repo-p11-23343082
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run application**
   ```bash
   flutter run
   ```

## 👥 Peran Anggota Tim

| No | Peran | Deskripsi | Assignee |
|---|---|---|---|
| 1 | Remote Data Source | Implementasi API calls dengan Dio | Rendi Aigo Brandon |
| 2 | Local Data Source | Implementasi Secure Storage untuk cache | TBD |
| 3 | Repository Implementation | Business logic dan orchestration | TBD |
| 4 | Dio Auth Interceptor | JWT/Token authentication & error handling | TBD |

## 📦 Dependencies

```yaml
dependencies:
  dio: ^5.9.2                    # HTTP client
  flutter_secure_storage: ^10.3.1 # Secure local storage
```

## 🔄 Workflow Tim

1. Setiap anggota membuat branch dengan nama: `feature/[nama-fitur]`
2. Commit dengan prefix: `feat:`, `fix:`, `docs:`, etc.
3. Buat Pull Request dengan deskripsi yang jelas
4. Minimal 1 review dari anggota lain sebelum merge
5. Setelah merge, delete branch

Contoh:
```bash
git checkout -b feature/remote-data-source
git commit -m "feat: implement remote data source with Dio"
git push origin feature/remote-data-source
```

## 📝 Catatan Penting

- Jangan push langsung ke `main` branch
- Selalu pull sebelum push untuk avoid conflicts
- Buat commit message yang deskriptif
- Test code sebelum push
- Update dokumentasi jika ada perubahan struktur

## 📚 Resources

- [Repository Pattern Flutter](https://resocoder.com/flutter-clean-architecture)
- [Dio Documentation](https://pub.dev/packages/dio)
- [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)

---

**Repository:** https://github.com/RendiAigoBrandon/repo-p11-23343082  
**Last Updated:** 2026-06-08
