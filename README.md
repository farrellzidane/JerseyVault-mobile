# JerseyVault (Mobile Version)

Sebuah proyek Flutter sederhana sebagai Tugas Mata Kuliah Pemrograman Berbasis Platform oleh Farrell Zidane Raihandrawan (2306275600)

## Tugas 7 : Elemen Dasar Flutter
### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
`StatelessWidget` adalah widget yang bersifat **statis** dan tidak berubah setelah dibuat; cocok untuk elemen UI yang tidak memerlukan pembaruan data. `StatefulWidget`, di sisi lain, **dapat berubah** selama aplikasi berjalan karena memiliki state yang dapat diperbarui, cocok untuk elemen yang dinamis atau interaktif.

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
#### Widget yang digunakan :
1. **MaterialApp** : Root widget aplikasi, mengatur tema dan titik awal aplikasi.
2. **Scaffold** : Struktur dasar halaman yang menyediakan `AppBar`, `body`, dan struktur layout lainnya.
3. **AppBar** : Header bagian atas halaman yang berisi judul aplikasi.
4. **Text** : Menampilkan teks statis di layar.
5. **Padding** : Menambahkan jarak di sekitar widget.
6. **Column** : Menyusun layout secara vertikal.
7. **Row** : Menyusun layout secara horizontal untuk menampilkan beberapa widget `InfoCard`.
8. **Card** : Menyediakan tampilan kartu dengan desain material yang memiliki efek *shadow* untuk `InfoCard`.
9. **Container** : Widget fleksibel untuk menyimpan elemen dan mengatur ukuran, padding, serta warna latar belakang.
10. **SizedBox** : Memberikan jarak kosong atau memanipulasi ukuran widget.
11. **Center** : Menempatkan *child widget* di tengah secara horizontal.
12. **GridView.count** : Menampilkan widget dalam bentuk grid dengan jumlah kolom tetap.
13. **ItemCard** (Custom Widget) : Widget kartu khusus untuk item menu yang menggunakan `InkWell` untuk mendeteksi interaksi.
14. **InkWell** : Membuat `ItemCard` dapat ditekan dan menampilkan efek *ripple* saat ditekan.
15. **SnackBar** : Menampilkan *pop-up message* di bagian bawah layar ketika item ditekan.
16. **Material** : Menambahkan visual material pada widget.
17. **Icon** : Menampilkan ikon material.

### 3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi `setState()` dalam Flutter digunakan pada `StatefulWidget` untuk memberi tahu framework bahwa ada perubahan data yang memerlukan pembaruan UI. Ketika `setState()` dipanggil, Flutter akan memanggil ulang metode `build()`, sehingga tampilan akan diperbarui sesuai perubahan data.

#### Variabel yang Terdampak setState()
1. Variabel tampilan - Misalnya, counter atau teks yang tampil di UI.
2. Kondisi atau status - Seperti flag isLoading untuk menunjukkan status loading atau kondisi lainnya.
3. Daftar atau koleksi data - Seperti List yang menampilkan elemen dinamis di UI.
**Catatan**: Gunakan `setState()` hanya untuk variabel yang memengaruhi tampilan agar aplikasi tetap efisien.

### 4. Jelaskan perbedaan antara const dengan final.
#### final
- **Nilainya ditetapkan hanya sekali** dan tidak bisa diubah setelah inisialisasi.
- **Dapat diinisialisasi pada saat runtime**, sehingga cocok untuk nilai yang baru diketahui saat aplikasi berjalan.
Contoh kode :
```dart
    final DateTime now = DateTime.now(); // Bisa ditentukan saat runtime
```

#### const
- Bersifat *compile-time constant* (konstan sejak kompilasi).
- Harus diinisialisasi dengan nilai yang sudah pasti (konstan) sejak awal, sehingga tidak bisa menggunakan nilai runtime.
- Dalam Flutter, `const` digunakan untuk widget yang tidak berubah agar lebih efisien dalam performa.
Contoh kode : 
```dart
    const int daysInWeek = 7; // Ditentukan saat kompilasi
```


### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
1. Menginstall Flutter dan Android Studio
2. Membuat repository bernama `JerseyVault-mobile`
3. Membuat proyek baru Flutter dengan menjalankan command 
```bash
    flutter create jerseyvault
    cd jerseyvault
```
4. Merapihkan Struktur project sebagai berikut
    - Membuat file `menu.dart` dan import package flutter `material.dart`
        ```dart
        'package:flutter/material.dart';
        ```
    - Memindahkan kode berikut dari `main.dart` ke `menu.dart`
        ```dart
            class MyHomePage ... {
                ...
            }

            class _MyHomePageState ... {
                ...
            }
        ```

    - Memodifikasi kode pada `main.dart`
        ```dart
            import 'package:mental_health_tracker/menu.dart';
            ...
            home: const MyHomePage(title: 'Flutter Demo Home Page'), // baris 34
        ```

5. Membuat Widget Sederhana 
    - Mengubah Tema Warna Aplikasi dengan menambahkan kode berikut pada `main.dart`
        ```dart
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple,
            ).copyWith(secondary: Colors.deepPurple[400]),
        ```
    - Mengubah Sifat *Widget* Halaman Menu menjadi *Stateless* dengan memodifikasi kode pada `main.dart` dan `menu.dart`
        
        ```dart
        // main.dart
            MyHomePage(), // mengganti const MyHomePage(title: 'Flutter Demo Home Page')
        ```

        ```dart
        // menu.dart
            class MyHomePage extends StatelessWidget {
                MyHomePage({super.key});

                @override
                Widget build(BuildContext context) {
                return Scaffold(
                    ... // jangan copy titik-titik ini!
                );
                }
            }
        ```
    - Membuat *Card* Sederhana yang Berisi NPM, Nama, dan Kelas dengan cara membuat *class* `InfoCard` pada `menu.dart`
        ```dart
            // menu.dart
            class MyHomePage extends StatelessWidget {
                final String npm = '2306275600'; // NPM
                final String name = 'Farrell Zidane Raihandrawan'; // Nama
                final String className = 'PBP B'; // Kelas
                ...

            class InfoCard extends StatelessWidget {
            // Kartu informasi yang menampilkan title dan content.

            final String title;  // Judul kartu.
            final String content;  // Isi kartu.

            const InfoCard({super.key, required this.title, required this.content});

            @override
            Widget build(BuildContext context) {
                return Card(
                // Membuat kotak kartu dengan bayangan dibawahnya.
                elevation: 2.0,
                child: Container(
                    // Mengatur ukuran dan jarak di dalam kartu.
                    width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
                    padding: const EdgeInsets.all(16.0),
                    // Menyusun title dan content secara vertikal.
                    child: Column(
                    children: [
                        Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(content),
                        ],
                    ),
                ),
                );
            }
            }
        ```
    - Membuat *Button Card* Sederhana dengan Icon
        ```dart
            // menu.dart

             class MyHomePage extends StatelessWidget {  
                ...
                final List<ItemHomepage> items = [
                    ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag),
                    ItemHomepage("Tambah Produk", Icons.add),
                    ItemHomepage("Logout", Icons.logout),
                ];
                ...
            }
            ...
            class ItemHomepage {
                final String name;
                final IconData icon;

                ItemHomepage(this.name, this.icon);
            }
            ...
            class ItemCard extends StatelessWidget {
                final ItemHomepage item;

                const ItemCard(this.item, {super.key});

                @override
                Widget build(BuildContext context) {
                    // Tentukan warna berdasarkan nama item
                    Color backgroundColor;
                    if (item.name == "Logout") {
                    backgroundColor = Colors.red; // Warna merah untuk Logout
                    } else if (item.name == "Tambah Produk") {
                    backgroundColor = Colors.blue; // Warna biru untuk Tambah Produk
                    } else if (item.name == "Lihat Daftar Produk") {
                    backgroundColor = Colors.green; // Warna hijau untuk Lihat Produk
                    } else {
                    backgroundColor = Theme.of(context).colorScheme.secondary; // Warna default
                    }

                    return Material(
                    color: backgroundColor, // Gunakan backgroundColor yang sudah ditentukan
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                        onTap: () {
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                            SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                            );
                        },
                        child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Icon(
                                item.icon,
                                color: Colors.white,
                                size: 30.0,
                                ),
                                const Padding(padding: EdgeInsets.all(3)),
                                Text(
                                item.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                                ),
                            ],
                            ),
                        ),
                        ),
                    ),
                    );
                }
                }
            ...
        ```

    - Lakukan Pengintegrasian `InfoCard` dan `ItemCard` untuk ditampilkan di MyHomePage  
        ```dart
            //menu.dart
            ...
            class MyHomePage extends StatelessWidget {
            ...  

            @override
            Widget build(BuildContext context) {
                // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
                return Scaffold(
                // AppBar adalah bagian atas halaman yang menampilkan judul.
                appBar: AppBar(
                    // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
                    title: const Text(
                    'Mental Health Tracker',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                    // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
                    backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                // Body halaman dengan padding di sekelilingnya.
                body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    // Menyusun widget secara vertikal dalam sebuah kolom.
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        // Row untuk menampilkan 3 InfoCard secara horizontal.
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            InfoCard(title: 'NPM', content: npm),
                            InfoCard(title: 'Name', content: name),
                            InfoCard(title: 'Class', content: className),
                        ],
                        ),

                        // Memberikan jarak vertikal 16 unit.
                        const SizedBox(height: 16.0),

                        // Menempatkan widget berikutnya di tengah halaman.
                        Center(
                        child: Column(
                            // Menyusun teks dan grid item secara vertikal.

                            children: [
                            // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                            const Padding(
                                padding: EdgeInsets.only(top: 16.0),
                                child: Text(
                                'Welcome to Mental Health Tracker',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                ),
                                ),
                            ),

                            // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                            GridView.count(
                                primary: true,
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 3,
                                // Agar grid menyesuaikan tinggi kontennya.
                                shrinkWrap: true,

                                // Menampilkan ItemCard untuk setiap item dalam list items.
                                children: items.map((ItemHomepage item) {
                                return ItemCard(item);
                                }).toList(),
                            ),
                            ],
                        ),
                        ),
                    ],
                    ),
                ),
                );
            }
            }
            ...
        ``` 
6. Run Program

## Tugas 8

### 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
Di Flutter, `const` digunakan untuk membuat sebuah widget menjadi *immutable* atau tidak berubah sejak awal *compile*. Jika sebuah widget ditandai sebagai `const`, maka Flutter tidak perlu *rebuild* widget tersebut setiap UI di-*render*, karena tampilan widget tersebut tidak akan berubah.

Menggunakan `const` bermanfaat saat memiliki widget statis yang tidak perlu diperbarui ulang, seperti teks atau ikon yang tetap. Namun, sebaiknya hindari `const` jika widget atau variabel akan berubah selama siklus hidup aplikasi, seperti pada widget dinamis atau interaktif yang datanya dapat diperbarui.

### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`Column` menyusun widget secara **vertikal** (dari atas ke bawah), sedangkan `Row` menyusun widget secara **horizontal** (dari kiri ke kanan). 

Keduanya memiliki properti yang mirip, seperti `mainAxisAlignment` untuk mengatur posisi atau distribusi *child* widget (vertikal pada `Column` dan horizontal pada `Row`) dan `crossAxisAlignment` untuk mengatur posisi atau distribusi widget pada sumbu silang (horizontal pada `Column` dan vertikal pada `Row`).

#### Contoh implementasi :
- Column :
```dart
    Column(
        mainAxisAlignment: MainAxisAlignment.center, // Pusatkan widget secara vertikal
        crossAxisAlignment: CrossAxisAlignment.start, // Selaraskan widget ke kiri
        children: [
            Text('Item 1'),
            Text('Item 2'),
            Text('Item 3'),
        ],
    )
```

- Row
```dart
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Spasi di antara widget
        crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan widget secara vertikal
        children: [
            Icon(Icons.star),
            Icon(Icons.favorite),
            Icon(Icons.share),
        ],
    )

```
### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada tugas kali ini, saya menggunakan beberapa elemen input Flutter, yaitu :
- `TextFormField`:
    - Digunakan untuk mengambil input teks, seperti Nama Jersey, Deskripsi, Harga, dan Kuantitas.
    - Setiap `TextFormField` memiliki properti `validator` untuk memvalidasi input, misalnya memastikan bahwa input tidak kosong dan bahwa input untuk harga dan kuantitas merupakan angka.
    
- `ElevatedButton`:
    - Digunakan sebagai tombol Save untuk menyimpan data dari form. Tombol ini memicu proses validasi dan, jika berhasil, menampilkan dialog konfirmasi menggunakan `AlertDialog`.

Ada beberapa elemen yang tidak digunakan :
- `DropdownButton` : Digunakan untuk membuat daftar pilihan dan cocok untuk input pilihan terbatas seperti ukuran atau kategori.
- `CheckboxListTile` dan `Switch` : Digunakan untuk input pilihan ya/tidak, misalnya untuk menentukan apakah produk tersedia.
- `Slider` : Dapat digunakan untuk input angka dalam rentang tertentu.

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Untuk mengatur tema dalam aplikasi Flutter agar konsisten, saya mendefinisikan theme di level aplikasi melalui properti theme pada `MaterialApp` di file `main.dart`. Dengan mendefinisikan tema di `ThemeData`, saya bisa menentukan warna utama (`primarySwatch`) dan warna sekunder (`secondary`), serta pengaturan lainnya seperti teks dan gaya tombol, sehingga tema tersebut akan diterapkan secara global ke seluruh aplikasi. Ini memastikan tampilan aplikasi konsisten tanpa harus mengatur ulang tema di setiap layar atau widget.

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Untuk menangani navigasi dalam aplikasi Flutter dengan banyak halaman, saya menggunakan `Navigator` dan `MaterialPageRoute`. Dalam kode `jersey_card.dart`, navigasi diimplementasikan dengan memanfaatkan `Navigator.push` untuk berpindah ke halaman lain ketika tombol tertentu ditekan. `Navigator.push` menambahkan halaman baru ke stack navigasi, sehingga halaman saat ini akan tetap berada di bawah halaman baru yang dibuka, dan pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol *back*.

Pada kode di atas, ketika tombol dengan nama `"Add new Jersey"` ditekan, `Navigator.push` dipanggil dengan MaterialPageRoute, yang akan membuka halaman `JersyEntryFormPage`. Ini dilakukan dengan memanggil `Navigator.push(context, MaterialPageRoute(builder: (context) => const JersyEntryFormPage()))`. Metode ini membuat navigasi antarhalaman sederhana dan memungkinkan pengguna kembali ke halaman sebelumnya. 