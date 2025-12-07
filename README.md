# Absolute Cinema: Your Absolute Movie Partner!

Absolute Cinema adalah aplikasi Flutter ringan untuk menjelajahi film-film populer dari **The Movie Database (TMDB)**.
Cari, telusuri, dan lihat ringkasan film dengan antarmuka bersih dan performa cepat. Aplikasi ini menampilkan poster, sinopsis singkat, tanggal rilis, dan rating — semua didorong oleh **API TMDB.**

Fitur utama:
- pemanggilan API dengan dio
- tampilan daftar film dengan infinite scroll
- arsitektur sederhana yang mudah dikembangkan.

## Persiapan environment / API key
> (!) Disclaimer: API key tidak disediakan di dalam repository ini, silakan pakai API key dari TMDB sendiri.
- Buat akun TMDB → salin **API Key (v3)**.
- Simpan di file `.env` (di root directory folder aplikasi ini) dengan isi:

```env
TMDB_API_KEY=<your_real_tmdb_key>
```

## Cara menjalankan

### Opsi A: menggunakan .env (default)
```bash
flutter run
```
- Pastikan `.env` ada di root project dan memuat `TMDB_API_KEY`.

### Opsi B: via `--dart-define`
```bash
flutter run --dart-define=TMDB_API_KEY=your_real_tmdb_key
```

### VS Code launch.json
Tambahkan argumen jika ingin disimpan di konfigurasi debug:
```json
{
	"version": "0.2.0",
	"configurations": [
		{
			"name": "Flutter",
			"request": "launch",
			"type": "dart",
			"args": ["--dart-define=TMDB_API_KEY=your_real_tmdb_key"]
		}
	]
}
```
