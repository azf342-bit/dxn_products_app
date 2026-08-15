import 'package:flutter/material.dart';

void main() {
  runApp(const DxnProductsApp());
}

class DxnProductsApp extends StatelessWidget {
  const DxnProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'منتجات DXN',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Map<String, String>> products = [
    {
      'name': 'قهوة لينجزي 3 في 1',
      'description':
          'قهوة DXN الشهيرة مع فطر الجانوديرما، لمحبي القهوة.',
    },
    {
      'name': 'سبيرولينا',
      'description':
          'منتج غذائي من الطحالب الخضراء ويُستخدم كمصدر للعناصر الغذائية.',
    },
    {
      'name': 'مورينزي',
      'description':
          'مشروب نباتي من فاكهة النوني يمكن تناوله ضمن نظام غذائي متوازن.',
    },
    {
      'name': 'معجون أسنان جانوزي',
      'description':
          'معجون أسنان للاستخدام اليومي ضمن منتجات العناية الشخصية.',
    },
    {
      'name': 'صابون جانوزي',
      'description':
          'صابون للعناية بالبشرة والاستخدام اليومي.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'منتجات DXN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.shopping_bag,
                  size: 30,
                ),
              ),
              title: Text(
                product['name']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  product['description']!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(
                      name: product['name']!,
                      description: product['description']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final String name;
  final String description;

  const ProductPage({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.shopping_bag,
              size: 100,
            ),
            const SizedBox(height: 20),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'معرفة المزيد',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
