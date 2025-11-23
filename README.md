# UTS Mobile Programming – SweetBite Bakery Cart App

Repository ini berisi project UTS mata kuliah Mobile Programming.
Nama : Nazwa Khoerunnisa
NIM 23552011093
Kelas : TIF RP 23 CNS A

Aplikasi dibuat menggunakan Flutter dengan state management Cubit, sesuai ketentuan soal UTS.


1. Perbedaan Cubit dan Bloc dalam Arsitektur Flutter 

Cubit dan Bloc sama-sama bagian dari flutter_bloc, tetapi punya cara kerja berbeda:

Cubit

- Mengelola state secara sederhana.

- Hanya memiliki satu arah perubahan state: memanggil emit().

- Cocok untuk aplikasi kecil–menengah dan fitur yang tidak kompleks.

- Kodenya lebih singkat dan mudah dipahami.

Bloc

- Menggunakan event dan state (lebih kompleks).

- Setiap perubahan state harus melalui event, sehingga arus data lebih terstruktur.

- Cocok untuk aplikasi besar atau sistem yang membutuhkan kontrol ketat terhadap alur data.

- Lebih verbose, tetapi sangat kuat untuk kasus kompleks.

Kesimpulan:
Cubit = lebih sederhana dan cepat.
Bloc = lebih terstruktur dan cocok untuk skala besar.

2. Pentingnya Pemisahan Model, Logika Bisnis, dan UI (10 poin)

Dalam Flutter, pemisahan ini mengikuti konsep clean architecture supaya aplikasi:

1. Lebih Mudah Dikelola

Logika bisnis tidak bercampur dengan tampilan sehingga perubahan UI tidak mengganggu fungsi aplikasi.

2. Lebih Mudah Diuji

Unit test lebih mudah dilakukan saat model dan logika tidak bercampur dengan widget UI.

3. Reusable & Terstruktur

Model dapat dipakai ulang, logika Cubit dapat digunakan pada banyak halaman, dan UI bisa bebas dimodifikasi.

4. Mengurangi Error

Jika semua bercampur, aplikasi mudah error dan sulit diperbaiki.
Dengan pemisahan folder (models/, blocs/, pages/, widgets/), kode jadi rapi dan konsisten.

3. Tiga State yang Mungkin Digunakan dalam CartCubit (10 poin)

Walaupun CartCubit menggunakan List Map sebagai state, di dalam prosesnya terdapat beberapa keadaan yang penting:

1. State: Keranjang Kosong

- Berarti belum ada produk ditambahkan.

- Digunakan untuk menampilkan UI seperti “Keranjang kosong”.

2. State: Produk Ditambahkan

- Terjadi ketika user menekan tombol Tambah.

- State berubah, jumlah item bertambah, dan UI langsung update.

3. State: Jumlah Produk Berubah

- Terjadi ketika kuantitas diperbarui (misalnya fitur + / −).

- Total item dan total harga ikut berubah real-time.

4. (Opsional) State: Checkout

Keranjang dikosongkan dengan clearCart().

UI kembali ke kondisi awal.
