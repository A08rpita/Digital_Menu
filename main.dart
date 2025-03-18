import 'package:flutter/material.dart';
import 'dart:html' as html;

void main() => runApp(RestaurantApp());

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasty Bites',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasty Bites 🍽️', style: TextStyle(fontFamily: 'Pacifico')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Section
            Image.asset('assets/banner.png', fit: BoxFit.cover, height: 300, width: double.infinity),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to Tasty Bites – Where Every Bite is a Delight! 🍕🍔🥗',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            // Menu Section
            MenuSection(),
          ],
        ),
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem('Burger', 'A juicy gourmet burger with all the fixings.', 5.99, 'assets/burger.png'),
    MenuItem('Pizza', 'Cheesy pepperoni pizza with a golden crust.', 8.99, 'assets/pizza.png'),
    MenuItem('Pasta', 'Creamy pasta with grilled chicken and basil.', 7.49, 'assets/pasta.png'),
    MenuItem('Salad', 'Fresh salad with mixed greens and vinaigrette.', 4.99, 'assets/salad.png'),
    MenuItem('Fried Chicken', 'Crispy golden-brown chicken drumsticks.', 6.99, 'assets/chicken.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(item.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(item.description, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                      SizedBox(height: 10),
                      Text('\$${item.price}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => html.window.alert('${item.name} added to cart! 🛒'),
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MenuItem {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  MenuItem(this.name, this.description, this.price, this.imageUrl);
}
