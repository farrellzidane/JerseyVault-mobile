import 'package:flutter/material.dart';
import 'package:jerseyvault/screens/jerseyentry_form.dart';

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    // Tentukan warna berdasarkan nama item
    Color backgroundColor;
    if (item.name == "Logout") {
      backgroundColor = Colors.red; // Warna merah untuk Logout
    } else if (item.name == "Add new Jersey") {
      backgroundColor = Colors.blue; // Warna biru untuk Add new Jersey
    } else if (item.name == "List of Jersey") {
      backgroundColor = Colors.green; // Warna hijau untuk Lihat Jersey
    } else {
      backgroundColor =
          Theme.of(context).colorScheme.secondary; // Warna default
    }

    return Material(
      color: backgroundColor, // Gunakan backgroundColor yang sudah ditentukan
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Add new Jersey") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const JersyEntryFormPage(),
                ));
          }
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
