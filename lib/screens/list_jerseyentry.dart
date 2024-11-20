import 'package:flutter/material.dart';
import 'package:jerseyvault/models/jersey_entry.dart';
import 'package:jerseyvault/screens/detail_page.dart';
import 'package:jerseyvault/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class JerseyEntryPage extends StatefulWidget {
  const JerseyEntryPage({super.key});

  @override
  State<JerseyEntryPage> createState() => _JerseyEntryPageState();
}

class _JerseyEntryPageState extends State<JerseyEntryPage> {
  Future<List<Product>> fetchjersey(CookieRequest request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http:///127.0.0.1:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object Product
    List<Product> listJersey = [];
    for (var d in data) {
      if (d != null) {
        listJersey.add(Product.fromJson(d));
      }
    }
    return listJersey;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jersey Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchjersey(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data Jersey pada JerseyVault.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => InkWell(
                        onTap: () {
                          // Navigasi ke halaman detail
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                product:
                                    snapshot.data![index], // Kirim data jersey
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].fields.jerseyName}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                  "${snapshot.data![index].fields.description}"),
                              const SizedBox(height: 10),
                              Text("${snapshot.data![index].fields.quantity}"),
                              const SizedBox(height: 10),
                              Text("${snapshot.data![index].fields.price}")
                            ],
                          ),
                        ),
                      ));
            }
          }
        },
      ),
    );
  }
}
