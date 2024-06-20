import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class fooddesign extends StatefulWidget
{
  final String image;
  final String name;
  final String price;
  fooddesign({super.key, required this.image, required this.name, required this.price});


  @override
  State<fooddesign> createState() => _fooddesignState();
}

class _fooddesignState extends State<fooddesign>
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.width / 2.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      //style: titleStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.5, right: 4.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RatingBar(
                      initialRating: 5.0,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 15,
                      unratedColor: Colors.black,
                      itemPadding: EdgeInsets.only(right: 4.0),
                      ignoreGestures: true,
                      ratingWidget: RatingWidget(
                          full: Icon(Icons.star),
                          half: Icon(Icons.star_border),
                          empty: Icon(Icons.star_border)),
                      onRatingUpdate: (rating) {},
                    ),
                    Text('4.0'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '\$${widget.price}' ,
                    ),
                    Card(
                      margin: EdgeInsets.only(right: 1),
                      shape: RoundedRectangleBorder(),
                      color: Colors.blue,
                      child: InkWell(
                        onTap: (){},
                        splashColor: Colors.white60,
                        customBorder:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}