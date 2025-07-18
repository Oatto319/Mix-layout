import 'package:flutter/material.dart';

class Car {
  final String name, spec, imageUrl;
  const Car({required this.name, required this.spec, required this.imageUrl});
}

class CarInfoPage extends StatelessWidget {
  const CarInfoPage({super.key});

  final List<Car> cars = const [
    Car(
      name: 'GT‑R R35',
      spec: '3.8 L VR38DETT V6 TT, ≈480 hp (357 kW) & 433 lb‑ft (587 Nm), AWD, 6‑speed DCT' ,
      imageUrl: 'https://images.unsplash.com/photo-1627392690623-550864cda449?...q=80&w=678',
    ),
    Car(
      name: 'Nissan GT‑R R34',
      spec: '2.6 L RB26‑DETT twin‑turbo inline‑6, ≈280 PS, AWD' ,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ชื่อและสเปครถยนต์'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'ชื่อเเละสเปค',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cars[i].name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 6),
                        Text(cars[i].spec, style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
