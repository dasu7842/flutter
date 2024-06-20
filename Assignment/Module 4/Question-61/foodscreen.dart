import 'package:flutter/material.dart';
import 'foodscreen1.dart';

class foodscreen extends StatefulWidget
{
  const foodscreen({super.key});

  @override
  State<foodscreen> createState() => _foodscreenState();
}

final List<Map<String, dynamic>> dataList = [
  {'name': 'Vegatables and Egg', 'image': 'assets/imag1.jpg','prize': '13.50'},
  {'name': 'Avacado salad', 'image': 'assets/imag2.jpg','prize': '19.28'},
  {'name': 'Pancake with Orange juice', 'image': 'assets/imag3.jpg','prize': '15.90'},
  {'name': 'Vegatables', 'image': 'assets/imag4.jpg','prize': '18.50'},

];

class _foodscreenState extends State<foodscreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        child:  Column(
          children: [
            Row(
              children: [
                Text("Menu",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),

                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                IconButton(onPressed: (){
                  showModalBottomSheet(context: context,
                      builder:(context){
                        return Padding
                          (
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children:
                            [
                              Divider(height: 40,indent: 100,endIndent: 100,thickness: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Your Order', style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.food_bank, size: 30,)
                                ],
                              ),
                              ListTile(
                                leading: Image.asset('assets/imag5.jpg',height: 40,width: 40,),
                                title: Text(
                                  "Chiken Burger",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('250 g'),
                                trailing: Text('\$7.00',
                                  style:TextStyle(fontSize: 18),
                                ),
                              ),
                              ListTile(
                                leading: Image.asset('assets/imag2.jpg',height: 40,width: 40,),
                                title: Text(
                                  "Avacado Salad",

                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('350 g'),
                                trailing: Text('\$5.22',
                                  style:TextStyle(fontSize: 18),
                                ),
                              ),

                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total",
                                    style: TextStyle(fontSize: 18, color: Colors.black),),
                                  Text('\$12.22',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {

                                },
                                child: Text('Add to Cart',style: TextStyle(color: Colors.black),),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.blue)
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  );
                }, icon: Icon(Icons.filter_alt_outlined))
              ],
            ),
            Container(
              height: 50,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      label: Text('items'),
                      selected: true,
                      selectedColor: Colors.yellow,
                      onSelected: (value) {},
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                physics:BouncingScrollPhysics(),
                itemCount: 4,
              ),
            ),
            Container(
              height: 40,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("All")
                  );
                },
                scrollDirection: Axis.horizontal,
                physics:BouncingScrollPhysics(),
                itemCount: 10,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: List.generate(dataList.length, (index) => fooddesign(image: dataList[index]['image'],name: dataList[index]['name'],price: dataList[index]['prize'],),),

              ),
            ),
          ],
        ),

      ),
    );
  }
}