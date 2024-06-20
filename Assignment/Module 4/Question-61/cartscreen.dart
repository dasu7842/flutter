
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final List<Map<String, dynamic>> dataList = [
  {'name': 'Vegetables and Egg', 'image': 'assets/imag1.jpg', 'price': 13.50, 'quantity': 0},
  {'name': 'Avocado salad', 'image': 'assets/imag2.jpg', 'price': 19.28, 'quantity': 0},
  {'name': 'Pancake with Orange juice', 'image': 'assets/imag3.jpg', 'price': 15.90, 'quantity': 0},
  {'name': 'Vegetables', 'image': 'assets/imag4.jpg', 'price': 18.50, 'quantity': 0},
];

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0.0;

  void _addItem(int index) {
    setState(() {
      dataList[index]['quantity']++;
      totalPrice += dataList[index]['price'];
    });
  }

  void _removeItem(int index) {
    setState(() {
      if (dataList[index]['quantity'] > 0) {
        dataList[index]['quantity']--;
        totalPrice -= dataList[index]['price'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          dataList[index]['image'],
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Column(
                        children: [
                          Text(dataList[index]['name']),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () => _removeItem(index),
                              ),
                              Text("${dataList[index]['quantity']}"),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => _addItem(index),
                              ),
                            ],
                          )
                        ],
                      ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${dataList[index]['price']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),
              ),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
                child: Center(
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
