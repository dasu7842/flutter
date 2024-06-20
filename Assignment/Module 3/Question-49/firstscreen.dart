import 'package:flutter/material.dart';

class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("screen1"),),
      body: Center
        (
        child: SingleChildScrollView(
          child: Column

            (
            children:
            [
              Container
                (
                color: Colors.red,height: 250,
              ),
              SizedBox(height: 10,),
              Container(
                child: GridView.count
                  (
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap:true ,
                  children: List.generate(4, (index)
                  {
                    return Container(
                      color: Colors.blue,height: 150,
                    );

                  }),

                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: GridView.count
                  (
                  crossAxisCount: 3,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  shrinkWrap:true ,
                  children: List.generate(9, (index)
                  {
                    return Container(
                      color: Colors.yellow,height: 150,
                    );

                  }),

                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
