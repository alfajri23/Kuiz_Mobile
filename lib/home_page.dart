import 'package:flutter/material.dart';
import 'data_hotel.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Hotel"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final DataHotel place = hotelList[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage( index : index);
                }));
              },
              child: Card(
                child: Stack(
                  children: [
                    FittedBox(
                      child: Image.network(place.imageUrl[0]),
                      fit: BoxFit.fill,
                    ),
                    // Container(
                    //   child: Image.network(place.imageUrl[0], width: 120,),
                    // ),
                    Column(
                      children : [
                        Text(place.name),
                        Text(place.roomPrice),
                      ]


                    )
                  ],
                ),
              ),

            );
          },
        itemCount: hotelList.length,
        ),
      ),
    );
  }
}
