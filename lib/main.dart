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
      title: 'دليل منتجات DXN',
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

  final List<Map<String, String>> products = const [
    {
      'name': 'قهوة لينجزي 3 في 1',
      'description':
          'قهوة DXN الشهيرة مع فطر الجانوديرما، مناسبة لمحبي القهوة.',
    },
    {
      'name': 'سبيرولينا',
      'description':
          'منتج غذائي من الطحالب الخضراء ويُستخدم كمصدر للعناصر الغذائية.',
    },
    {
      'name': 'مورينزي',
      'description':
          'مشروب نباتي مصنوع من فاكهة النوني ويُستخدم ضمن نظام غذائي متوازن.',
    },
    {
      'name': 'معجون أسنان Ganozhi',
      'description':
          'معجون أسنان من منتجات DXN للاستخدام اليومي والعناية بالفم.',
    },
    {
      'name': 'صابون جانوزي',
      'description':
          'صابون للعناية اليومية بالبشرة.',
    },
    {
      'name': 'كريم Tea Tree',
      'description':
          'كريم للعناية بالبشرة والاستخدام الخارجي.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'دليل منتجات DXN',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 28,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                child: Text(
                  name.substring(0, 1),
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('سيتم إضافة رابط المنتج لاحقًا'),
                    ),
                  );
                },
                icon: const Icon(Icons.link),
                label: const Text('رابط المنتج'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
