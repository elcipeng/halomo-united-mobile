#Tugas 7: Elemen Dasar Flutter
Nama: Justin Dwitama Seniang
NPM: 2406406742
Kelas: PBP D

## 1.Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree dalam Flutter adalah struktur hierarki yang menggambarkan bagaimana setiap komponen aplikasi tersusun seperti pohon, dari widget utama hingga elemen terkecilnya. Setiap widget bisa menjadi induk (parent) yang berisi satu atau lebih anak (child), dan hubungan ini memungkinkan tampilan dibangun secara terstruktur. Parent widget mengatur tata letak serta perilaku anak-anaknya, sementara child menerima konteks dan pengaturan dari parent-nya. Perubahan pada parent bisa memengaruhi child, dan keseluruhan tree dibaca dari atas ke bawah, menciptakan tampilan yang dinamis dan fleksibel.

## 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

MaterialApp berfungsi sebagai root aplikasi yang menyediakan konfigurasi utama seperti tema, judul aplikasi, dan halaman awal.
Scaffold digunakan untuk membentuk struktur dasar halaman yang terdiri atas AppBar, Body, Drawer, dan Bottom Navigation.
AppBar menampilkan bilah di bagian atas aplikasi berisi judul "Football Shop" dengan warna utama sesuai tema.
Text menampilkan teks di layar, baik untuk judul, label, maupun informasi tambahan.
Padding memberikan jarak di sekitar widget, berfungsi untuk mengatur tata letak agar tampak rapi.
Column menyusun widget secara vertikal, digunakan untuk menempatkan InfoCard, teks sambutan, dan GridView.
Row menyusun widget secara horizontal, misalnya untuk menampilkan tiga InfoCard sejajar.
SizedBox berfungsi sebagai ruang kosong untuk memberi jarak antar elemen antarmuka.
Center menempatkan widget di tengah dari parent-nya.
GridView.count menampilkan kumpulan widget dalam format grid dengan jumlah kolom tetap (tiga kolom), digunakan untuk menampilkan tombol menu.
Card menampilkan panel dengan sudut melengkung dan efek bayangan, digunakan dalam InfoCard untuk menampilkan data seperti NPM, Nama, dan Kelas.
Container berfungsi sebagai wadah serbaguna yang dapat mengatur ukuran, padding, margin, serta dekorasi tampilan.
Material memberikan efek khas Material Design seperti warna latar dan sudut melengkung pada ItemCard.
InkWell menambahkan efek gelombang (ripple) saat widget ditekan dan menangani aksi tap, menjadikannya interaktif.
Icon digunakan untuk menampilkan ikon dari Material Icons, seperti ikon tas belanja, inventaris, dan tambah item.
SnackBar berfungsi menampilkan notifikasi singkat di bagian bawah layar ketika tombol ditekan.
ScaffoldMessenger mengelola dan menampilkan SnackBar dalam konteks Scaffold.

Custom Widget yang Dibuat:
InfoCard adalah widget custom bertipe StatelessWidget yang menampilkan informasi pengguna seperti NPM, Nama, dan Kelas dalam bentuk kartu dengan layout yang rapi.
ItemCard merupakan widget custom StatelessWidget yang menampilkan tombol menu berisi ikon, nama, dan warna tertentu. Saat ditekan, widget ini akan menampilkan SnackBar.
ItemHomepage bukan widget, melainkan class model yang menyimpan data untuk setiap tombol menu, termasuk atribut nama, ikon, dan warna.

## 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp berfungsi sebagai wadah utama aplikasi Flutter yang mengikuti konsep Material Design. Widget ini mengatur tema, navigasi antarhalaman, judul, hingga konfigurasi global seperti MediaQuery dan font. Karena menyediakan fondasi penting bagi tampilan dan navigasi, MaterialApp sering dijadikan root widget. Selain itu, penggunaannya memastikan desain yang konsisten, setup yang sederhana, serta mematuhi praktik standar Flutter untuk aplikasi berbasis Material Design.

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget digunakan untuk tampilan yang tidak berubah selama aplikasi berjalan, seperti teks atau ikon statis, sedangkan StatefulWidget digunakan ketika tampilan harus menyesuaikan perubahan data atau interaksi pengguna. StatelessWidget lebih ringan dan efisien, sementara StatefulWidget memiliki state yang dapat diperbarui untuk menampilkan perubahan secara dinamis. Misalnya, tombol penghitung (counter) atau formulir input lebih cocok memakai StatefulWidget, sedangkan tampilan statis cukup dengan StatelessWidget.

## 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext dapat diibaratkan sebagai alamat atau titik koordinat dari suatu widget di dalam widget tree. Setiap widget memiliki BuildContext yang berbeda, dan melalui konteks inilah widget dapat berkomunikasi dengan bagian lain dari aplikasi.

BuildContext memiliki peran penting karena memungkinkan widget mengakses data atau fitur dari widget lain yang berada di atasnya, seperti tema warna (melalui Theme.of(context)), ukuran layar (MediaQuery.of(context)), hingga sistem navigasi halaman (Navigator.of(context)). Dalam metode build(), BuildContext menjadi kunci untuk menghubungkan setiap bagian dari tampilan sehingga data, gaya, dan perilaku aplikasi dapat bekerja secara selaras. Tanpa konteks ini, setiap widget akan berdiri sendiri dan sulit berinteraksi satu sama lain.

## 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload memungkinkan pengembang melihat perubahan kode secara instan tanpa kehilangan state aplikasi. Flutter menyuntikkan kode baru ke Dart VM lalu memperbarui tampilan secara langsung—sangat berguna untuk perubahan kecil seperti warna atau teks. Sementara itu, hot restart menjalankan ulang aplikasi dari awal dan menghapus semua state yang tersimpan, biasanya digunakan ketika ada perubahan besar pada logika atau inisialisasi aplikasi.