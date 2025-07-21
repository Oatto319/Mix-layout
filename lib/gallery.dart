import 'package:flutter/material.dart';
import 'main.dart'; // สมมติ MyHomePage อยู่ในนี้
import 'carinformation.dart'; // สมมติ CarInfoPage อยู่ในนี้

// -------------------- Car Class --------------------
class Car {
  final String name, spec, imageUrl;
  const Car({required this.name, required this.spec, required this.imageUrl});
}

// -------------------- Static Car List --------------------
const List<Car> cars = [
  Car(
    name: 'GT‑R R35',
    spec: '3.8 L VR38DETT V6 TT, ≈480 hp (357 kW) & 433 lb‑ft (587 Nm), AWD, 6‑speed DCT',
    imageUrl: 'https://images.unsplash.com/photo-1627392690623-550864cda449?...q=80&w=678',
  ),
  Car(
    name: 'Nissan GT‑R R34',
    spec: '2.6 L RB26‑DETT twin‑turbo inline‑6, ≈280 PS, AWD',
    imageUrl: 'https://images.unsplash.com/photo-1677529459221-7ae934536562?...q=80&w=687',
  ),
  Car(
    name: 'Skyline GT‑R R32',
    spec: '2.6 L RB26DETT I6 TT, 280 HP @6800rpm, 266 lb‑ft (361 Nm) @4400rpm, AWD, 5‑speed MT',
    imageUrl: 'https://images.unsplash.com/photo-1749965186606-582844c046ae?...q=80&w=687',
  ),
  Car(
    name: 'Skyline GT‑R R33',
    spec: '2.6 L RB26DETT I6 TT, 280 HP (206 kW), 271 lb‑ft (367 Nm), AWD, 5‑speed MT',
    imageUrl: 'https://images.unsplash.com/photo-1743386136226-3c3c61129f23?...q=80&w=735',
  ),
];

// -------------------- Full Screen Image Page --------------------
class FullImagePage extends StatelessWidget {
  final String imageUrl;
  const FullImagePage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('รูปภาพเต็ม')),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}

// -------------------- Gallery Page (GridView only) --------------------
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery Page')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Text(
                'รูปรถ',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('หน้าหลัก'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('รูปรถ'),
              onTap: () {
                Navigator.pop(context);
                // เราอยู่หน้า Gallery อยู่แล้ว ไม่ต้องทำอะไรเพิ่มเติม
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_car),
              title: const Text('ข้อมูลรถ'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const CarInfoPage()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: cars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () => Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (_) => FullImagePage(imageUrl: cars[i].imageUrl),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white24),
                  image: DecorationImage(
                    image: NetworkImage(cars[i].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
