import 'package:flutter/material.dart';
import 'package:newsapp/const/const.dart';
import 'package:newsapp/service/get_restaurants_data.dart';
import 'package:newsapp/widgets_main_menu/title.dart';

class MainMenuRestaurants extends StatelessWidget {
  const MainMenuRestaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Title1(),
            FutureBuilder(
              future: GetData().readJsonRestaurant(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                var data = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: data['restaurants'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: p1a,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 8,
                            child: Card(
                              shape: boraci20,
                              child: Padding(
                                padding: p1a,
                                child: Row(
                                  children: [
                                    Image.network(
                                      data['restaurants'][index]['pictureId'],
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data['restaurants'][index]['name'],
                                          style: h2,
                                        ),
                                        Text(
                                          data['restaurants'][index]['city'],
                                          style: h4,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
