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

## Tugas 9
### 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Model digunakan untuk membantu mengelola data JSON dengan cara yang **lebih terstruktur** dan **rapih**. Dengan membuat model, data dari JSON dapat langsung di-*mapping* ke dalam objek Dart yang memiliki tipe data yang jelas. Tanpa membuat model, user harus menangani data secara manual dan memastikan semua kunci dan tipe data sesuai. Ini membuat kode rentan terhadap *runtime error*, seperti kesalahan saat mengambil kunci JSON atau mencoba memproses tipe data yang tidak sesuai. 

### 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library `http` digunakan untuk membantu aplikasi berkomunikasi dengan server. Dalam tugas ini, library tersebut digunakan untuk mengambil data dari API melalui permintaan HTTP, seperti `GET`, dan menerima respon berupa JSON. Data yang diambil dari server kemudian diolah dan ditampilkan di app, misalnya untuk menampilkan daftar jersey. Dengan library ini, aplikasi flutter ini bisa terhubung ke backend untuk mendapatkan atau mengirim data secara langsung.

### 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Fungsi dari `CookieRequest` adalah alat untuk mengelola permintaan HTTP yang memerlukan autentikasi berbasis cookie, digunakan untuk mengirim dan menerima data dari server sambil menyimpan informasi autentikasi (seperti *cookiesessions*) yang diperlukan untuk menjaga status login user

Instance `CookieRequest` perlu dibagikan ke semua komponen aplikasi agar berbagai bagian aplikasi bisa mengakses informasi autentikasi yang sama. Misalnya, saat user berpindah antar layar, status login tetap terjaga, dan komponen lain yang membutuhkan data dari server dapat menggunakan cookie yang tersimpan tanpa perlu autentikasi ulang.

### 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. **Pengisian Data di Form Input** :   
    User memasukkan data melalui `TextFormField` di `jerseyentry_form.dart`, seperti **nama jersey**, **deskripsi**, **harga**, dan **jumlah**. Input ini disimpan ke dalam variabel seperti `_jersey`, `_description`, `_price`, dan `_quantity`. Sebelum dikirim, data divalidasi menggunakan metode `validator` untuk memastikan bahwa semua input sudah benar dan tidak kosong.

2. **Pengiriman Data ke Backend** :
    Setelah form divalidasi, data dikirim ke server Django menggunakan metode `postJson` dari `CookieRequest`. Data yang dikirim di-encode ke format JSON menggunakan `jsonEncode`, dengan **key-value** sesuai dengan format yang diterima backend (contohnya `jersey_name`, `description`, dll.). Server Django menerima data ini melalui endpoint, seperti `http://127.0.0.1:8000/create-flutter/`, memprosesnya (misalnya menyimpannya ke dalam database), dan mengembalikan respons.

3. **Respon dari Backend** : Backend memberikan respons berupa JSON yang berisi status (success atau error) dan pesan tambahan jika diperlukan. Jika statusnya success, aplikasi akan menampilkan notifikasi menggunakan `ScaffoldMessenger` bahwa data berhasil disimpan. Jika terjadi kesalahan, pengguna akan mendapatkan notifikasi kesalahan.

4. **Menampilkan Data** : Data yang telah dikirimkan dan disimpan di database dapat diambil kembali menggunakan metode `HTTP GET` di halaman seperti `list_jerseyentry.dart`. Fungsi `fetchjersey` mengambil data dari server melalui endpoint (misalnya `http://127.0.0.1:8000/json/`) dan mengubah JSON yang diterima menjadi objek Dart (model Product) menggunakan metode `Product.fromJson`. Objek ini kemudian digunakan untuk menampilkan data di layar, seperti **nama jersey**, **deskripsi**, **harga**, dan **jumlah**.


### 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
#### **Login:**
- **Input:** Pengguna mengisi username/email dan password di aplikasi Flutter. 
- **Proses di Django:** Data login dikirim menggunakan `HTTP POST` ke endpoint login Django. Django memeriksa kecocokan username/email dan password. Jika valid, Django membuat sesi untuk pengguna dan mengirimkan cookie sesi kembali ke Flutter. 
- **Flutter:** Cookie yang diterima disimpan oleh **CookieRequest** untuk digunakan pada permintaan yang memerlukan autentikasi.

#### **Register:**
- **Input:** Pengguna mengisi data seperti nama, email, dan password melalui Flutter. 
- **Proses di Django:** Data registrasi dikirim menggunakan `HTTP POST` ke endpoint register Django. Django memvalidasi data dan menyimpannya ke dalam database jika semua data valid.
- **Flutter:** Jika registrasi berhasil, aplikasi mengarahkan pengguna ke halaman login.

#### **Logout:**
- **Flutter:** Aplikasi mengirim permintaan HTTP (`GET` atau `POST`) ke endpoint logout Django dengan menyertakan cookie sesi.
- **Django:** Django menghapus sesi pengguna sehingga cookie menjadi tidak valid.
- **Flutter:** Cookie dihapus dari **CookieRequest**, dan aplikasi mengarahkan pengguna kembali ke halaman login.

#### **Menampilkan Menu Setelah Login:**
- Setelah login, setiap permintaan ke server menyertakan cookie sesi untuk memverifikasi autentikasi pengguna. Jika cookie valid, server memproses permintaan dan mengembalikan data yang diperlukan. Data ini kemudian digunakan Flutter untuk menampilkan menu atau halaman yang hanya dapat diakses oleh pengguna yang telah login.


### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
#### Step-by-Step Implementasi Checklist

- Saya memulai dengan mengimplementasikan fitur registrasi akun pada Flutter. Langkah pertama adalah membuat aplikasi autentikasi (authentication app) di dalam proyek Django saya bernama **JerseyVault    **. Setelah itu, saya menyesuaikan berbagai pengaturan yang diperlukan untuk aplikasi Django baru, seperti melakukan konfigurasi di **`settings.py`**, menambahkan dependensi menggunakan **`pip install`**, dan memperbarui file **`requirements.txt`**.

- Selanjutnya, saya membuat metode untuk login di file **`views.py`** dalam aplikasi authentication. Metode ini bertugas memproses permintaan login. Setelah itu, saya menambahkan pengaturan pada **`urls.py`** untuk menghubungkan endpoint yang diperlukan.

- Untuk mengintegrasikan sistem autentikasi di Flutter, saya menginstal package yang disebutkan dalam tutorial. Saya kemudian memperbarui file **`main.dart`** untuk mendefinisikan **`CookieRequest`** sebagai provider global, sehingga dapat digunakan di berbagai bagian aplikasi.

```dart
    // main.dart
    import 'package:flutter/material.dart';
    import 'package:jerseyvault/screens/login.dart';
    // import 'package:jerseyvault/screens/menu.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return Provider(
        create: (_) {
            CookieRequest request = CookieRequest();
            return request;
        },
        child: MaterialApp(
            title: 'JerseyVault',
            theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
            ).copyWith(secondary: Colors.blue[400]),
            ),
            home: const LoginPage(),
        ),
        );
    }
    }

```

- Setelah konfigurasi dasar selesai, saya membuat file **`login.dart`** di dalam folder **`screens`** untuk menampilkan halaman login.

- Selanjutnya, saya menambahkan fungsi registrasi di **`views.py`** pada aplikasi authentication di Django agar pengguna baru dapat membuat akun. Di sisi Flutter, saya membuat layar baru bernama **`register.dart`** untuk menampilkan form registrasi bagi pengguna.

```python     
    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
        
    @csrf_exempt
    def register(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            username = data['username']
            password1 = data['password1']
            password2 = data['password2']

            # Check if the passwords match
            if password1 != password2:
                return JsonResponse({
                    "status": False,
                    "message": "Passwords do not match."
                }, status=400)
            
            # Check if the username is already taken
            if User.objects.filter(username=username).exists():
                return JsonResponse({
                    "status": False,
                    "message": "Username already exists."
                }, status=400)
            
            # Create the new user
            user = User.objects.create_user(username=username, password=password1)
            user.save()
            
            return JsonResponse({
                "username": user.username,
                "status": 'success',
                "message": "User created successfully!"
            }, status=200)
        
        else:
            return JsonResponse({
                "status": False,
                "message": "Invalid request method."
            }, status=400)
        
    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logout berhasil!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout gagal."
            }, status=401)
```

- Untuk membuat model kustom di Flutter, saya memanfaatkan data JSON yang dihasilkan oleh Django dengan mengakses endpoint lokalnya. Saya menggunakan situs **Quicktype** untuk mengonversi JSON menjadi model Dart. Hasil kode tersebut saya masukkan ke dalam file **`jersey_entry.dart`** yang saya tempatkan di folder baru bernama **`models`**.

- Untuk mengambil data dari Django, saya menambahkan dependensi **`http`** ke proyek Flutter dengan perintah **`flutter pub add http`**. Selain itu, saya melakukan modifikasi pada file di folder **`android`** agar pengaturan jaringan sesuai dengan tutorial.

- Saya kemudian membuat layar baru bernama **`list_jerseyentry.dart`** untuk menampilkan daftar produk. Halaman ini menyesuaikan antara struktur Flutter dan endpoint Django saya. Selanjutnya, saya menambahkan tautan ke halaman ini di **`LeftDrawer`**, serta memperbarui pengaturan agar layar ini dapat diakses dari menu utama.

- Pada halaman **`list_jerseyentry.dart`**, saya hanya menampilkan atribut dasar seperti nama produk, harga, dan deskripsi untuk menjaga antarmuka tetap sederhana dan informatif.

- Setelah itu, saya membuat halaman detail untuk setiap item di daftar produk dengan membuat layar baru bernama **`detail_page.dart`**. Layar ini digunakan untuk menampilkan detail atribut tambahan dari produk, seperti ukuran dan warna, serta menyediakan tombol untuk kembali ke halaman daftar produk.
```dart
    //detail_page.dart
    import 'package:flutter/material.dart';
    import 'package:jerseyvault/models/jersey_entry.dart';

    class DetailPage extends StatelessWidget {
    final Product product;

    const DetailPage({super.key, required this.product});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text("Jersey Details"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                product.fields.jerseyName,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 16),
                Text(
                "Description: ${product.fields.description}",
                style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                "Quantity: ${product.fields.quantity}",
                style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                "Price: ${product.fields.price}",
                style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                "User ID: ${product.fields.user}",
                style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                "Added on: ${product.fields.time.toLocal()}",
                style: const TextStyle(fontSize: 16),
                ),
            ],
            ),
        ),
        );
    }
    }

```

- Saya juga memperbarui **`list_jerseyentry.dart`** agar setiap kotak produk dapat ditekan untuk membuka halaman detail produk tertentu. Untuk mendapatkan data detail, saya membuat fungsi yang mengambil informasi spesifik dari backend menggunakan ID produk.

- Untuk mengintegrasikan form Flutter dengan Django, saya memodifikasi file **`views.py`** pada aplikasi utama Django dengan menambahkan fungsi **`create_product_flutter`**. Fungsi ini dipanggil oleh **`jerseyentry_form.dart`** di Flutter. Saya juga memastikan semua fungsi lain di file tersebut bekerja sesuai kebutuhan.

- Terakhir, saya menambahkan fitur logout. Prosesnya hampir serupa dengan login, di mana Flutter mengirimkan permintaan ke endpoint Django untuk menghapus sesi pengguna, dan setelah itu pengguna diarahkan kembali ke halaman login.