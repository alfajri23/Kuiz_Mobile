import 'package:flutter/material.dart';
import 'data_hotel.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({Key? key, required this.index}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final DataHotel place = hotelList[widget.index];
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                child: Row(
                  children: [
                    for (var i = 0; i < 3; i++)
                        Container(
                          color: Colors.red,
                          child: Image.network(place.imageUrl[i], width: 220,),
                        )

                  ],
                ),
              ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(place.name),
                Center(
                  child: Row(
                    children: [
                      for (var i = 0; i < int.parse(place.stars); i++)
                        Icon(
                          Icons.star,
                        ),
                    ],
                  ),
                ),
                Text(place.location),
                Text(place.roomPrice),
                Row(
                  children: [
                    for (var i = 0; i < place.facility.length; i++)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   Icons.star,
                          // ),
                          Text('0xe6e7'),
                          Text(place.facility[i])
                        ],
                      )
                  ],
                ),
                ElevatedButton(
                  onPressed:(){ _launchURL(place.websiteLink);},
                  child: Text("Halaman Website"),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
