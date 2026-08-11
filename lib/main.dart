import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const DXNProductsApp());
}

class DXNProductsApp extends StatelessWidget {
  const DXNProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'دليل منتجات DXN',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorSchemeSeed: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class Product {
  final String name;
  final String image;
  final String description;
  final String link;

  const Product({
    required this.name,
    required this.image,
    required this.description,
    required this.link,
  });
}

const List<Product> products = [
  Product(
    name: 'قهوة لينغزي 3 في 1',
    image: 'https://via.placeholder.com/600x400.png?text=DXN+Coffee',
    description:
        'قهوة لينغزي 3 في 1 من المنتجات المعروفة ضمن مجموعة DXN. اضغط على زر معرفة المزيد لفتح صفحة المنتج.',
    link: 'https://www.dxn2u.com/',
  ),
  Product(
    name: 'فطر الريشي',
    image: 'https://via.placeholder.com/600x400.png?text=Reishi',
    description:
        'منتج يعتمد على فطر الريشي، ويُستخدم ضمن مجموعة منتجات DXN. يمكنك معرفة المزيد من خلال الرابط.',
    link: 'https://www.dxn2u.com/',
  ),
  Product(
    name: 'سبيرولينا',
    image: 'https://via.placeholder.com/600x400.png?text=Spirulina',
    description:
        'سبيرولينا من المنتجات الغذائية التي تدخل ضمن مجموعة منتجات DXN.',
    link: 'https://www.dxn2u.com/',
  ),
  Product(
    name: 'مورينزي',
    image: 'https://via.placeholder.com/600x400.png?text=Morinzhi',
    description:
        'مورينزي من المنتجات التي تحتوي على مستخلص المورينغا، ويمكنك الاطلاع على تفاصيل المنتج من خلال الرابط.',
    link: 'https://www.dxn2u.com/',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'دليل منتجات DXN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),

        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.teal,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 55,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'مرحبًا بك في دليل منتجات DXN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'تعرّف على المنتجات واضغط على أي منتج لمعرفة المزيد.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(
                  12,
                  0,
                  12,
                  20,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          product.image,
                          height: 190,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) {
                            return Container(
                              height: 190,
                              color: Colors.grey.shade200,
                              child: const Icon(
                                Icons.image_not_supported_outlined,
                                size: 60,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Text(
                                product.description,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.6,
                                  color: Colors.grey.shade700,
                                ),
                              ),

                              const SizedBox(height: 15),

                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    openLink(product.link);
                                  },
                                  icon: const Icon(
                                    Icons.open_in_new,
                                  ),
                                  label: const Text(
                                    'معرفة المزيد',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding:
                                        const EdgeInsets.symmetric(
                                      vertical: 13,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
