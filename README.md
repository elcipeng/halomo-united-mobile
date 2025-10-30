#Tugas 7: Elemen Dasar Flutter
Nama: Justin Dwitama Seniang
NPM: 2406406742
Kelas: PBP D

## 1.Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree dalam Flutter adalah struktur hierarki yang menggambarkan bagaimana setiap komponen aplikasi tersusun seperti pohon, dari widget utama hingga elemen terkecilnya. Setiap widget bisa menjadi induk (parent) yang berisi satu atau lebih anak (child), dan hubungan ini memungkinkan tampilan dibangun secara terstruktur. Parent widget mengatur tata letak serta perilaku anak-anaknya, sementara child menerima konteks dan pengaturan dari parent-nya. Perubahan pada parent bisa memengaruhi child, dan keseluruhan tree dibaca dari atas ke bawah, menciptakan tampilan yang dinamis dan fleksibel.

## 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.


## 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp berfungsi sebagai wadah utama aplikasi Flutter yang mengikuti konsep Material Design. Widget ini mengatur tema, navigasi antarhalaman, judul, hingga konfigurasi global seperti MediaQuery dan font. Karena menyediakan fondasi penting bagi tampilan dan navigasi, MaterialApp sering dijadikan root widget. Selain itu, penggunaannya memastikan desain yang konsisten, setup yang sederhana, serta mematuhi praktik standar Flutter untuk aplikasi berbasis Material Design.

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget digunakan untuk tampilan yang tidak berubah selama aplikasi berjalan, seperti teks atau ikon statis, sedangkan StatefulWidget digunakan ketika tampilan harus menyesuaikan perubahan data atau interaksi pengguna. StatelessWidget lebih ringan dan efisien, sementara StatefulWidget memiliki state yang dapat diperbarui untuk menampilkan perubahan secara dinamis. Misalnya, tombol penghitung (counter) atau formulir input lebih cocok memakai StatefulWidget, sedangkan tampilan statis cukup dengan StatelessWidget.

## 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext dapat diibaratkan sebagai alamat atau titik koordinat dari suatu widget di dalam widget tree. Setiap widget memiliki BuildContext yang berbeda, dan melalui konteks inilah widget dapat berkomunikasi dengan bagian lain dari aplikasi.

BuildContext memiliki peran penting karena memungkinkan widget mengakses data atau fitur dari widget lain yang berada di atasnya, seperti tema warna (melalui Theme.of(context)), ukuran layar (MediaQuery.of(context)), hingga sistem navigasi halaman (Navigator.of(context)). Dalam metode build(), BuildContext menjadi kunci untuk menghubungkan setiap bagian dari tampilan sehingga data, gaya, dan perilaku aplikasi dapat bekerja secara selaras. Tanpa konteks ini, setiap widget akan berdiri sendiri dan sulit berinteraksi satu sama lain.

## 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload memungkinkan pengembang melihat perubahan kode secara instan tanpa kehilangan state aplikasi. Flutter menyuntikkan kode baru ke Dart VM lalu memperbarui tampilan secara langsung—sangat berguna untuk perubahan kecil seperti warna atau teks. Sementara itu, hot restart menjalankan ulang aplikasi dari awal dan menghapus semua state yang tersimpan, biasanya digunakan ketika ada perubahan besar pada logika atau inisialisasi aplikasi.