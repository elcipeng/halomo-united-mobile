# Tugas 7: Elemen Dasar Flutter
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

# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements
Nama: Justin Dwitama Seniang
NPM: 2406406742
Kelas: PBP D

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() menambahkan halaman baru di atas halaman sekarang, jadinya tombol kembali akan kembali ke halaman sebelumnya, misal dari daftar produk ke detail produk.
Navigator.pushReplacement() mengganti halaman sekarang dengan halaman baru, halaman sekarang dibuang, jadi tombol kembali akan melompat ke halaman sebelumnya lagi, misal dari halaman login ke home setelah berhasil masuk, agar pengguna tidak bisa kembali ke halaman login

## 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold adalah widget hierarki paling penting yang menyediakan struktur atau kayak rangka dasar untuk sebuah halaman. Rangka ini isinya properti untuk appBar (bagian header), body (konten utama halaman), dan drawer (menu navigasi samping). Dengan menggunakan Scaffold sebagai widget induk di setiap halaman aplikasi Football Shop, kita bisa dengan mudah memastikan konsistensi.

Kita bisa menempatkan AppBar di dalam properti appBar milik Scaffold untuk membuat header yang seragam di seluruh aplikasi, misalnya untuk menampilkan judul dan ikon keranjang belanja. Untuk Drawer, hierarkinya sedikit berbeda: Drawer bukan diletakkan di dalam AppBar, melainkan sebuah properti terpisah dari Scaffold itu sendiri (sama seperti appBar dan body). AppBar kemudian secara otomatis akan mendeteksi jika ada Drawer di Scaffold dan menampilkan ikon menu (hamburger) untuk membukanya. Dengan memanfaatkan struktur Scaffold seperti ini, kita bisa menjamin setiap halaman memiliki tampilan dan tata letak dasar yang konsisten

## 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Dalam membangun form, Padding sangat krusial untuk memberi tempat visual di sekitar elemen seperti TextField agar tidak menempel di tepi layar, misal saat membungkus form login. Untuk mengatasi masalah fungsional, SingleChildScrollView adalah semacam solusi dimana ia membungkus form agar halaman bisa di-scroll saat keyboard muncul, sehingga mencegah error overflow. terus ListView juga menyediakan scrolling tapi lebih optimal untuk daftar dinamis, seperti menampilkan item di Keranjang Belanja yang mungkin memiliki input jumlahnya sendiri

## 4.Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

buat menciptakan identitas visual yang konsisten di aplikasi Football Shop, kita harus mengatur ThemeData secara terpusat di dalam MaterialApp. Daripada mengatur warna di setiap halaman, kita mendefinisikan warna brand di satu tempat, seperti primaryColor untuk warna utama toko dan colorScheme untuk warna aksen. Dengan cara ini, semua AppBar di aplikasi akan otomatis menggunakan primaryColor tersebut, dan widget seperti FloatingActionButton akan menggunakan warna aksen, sehingga identitas visual brand tetap terjaga dengan kuat di seluruh aplikasi