import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/const/const.dart';
import 'package:newsapp/service/get_restaurants_data.dart';
import 'package:newsapp/view/detailed_pages.dart';
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
                if (snapshot.hasData) {
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
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      DetailedPagesRestaurantsLocalJson(
                                          details: snapshot.data['restaurants']
                                              [index]));
                                },
                                child: Card(
                                  shape: boraci20,
                                  child: Padding(
                                    padding: p1a,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            data['restaurants'][index]
                                                ['pictureId'],
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['restaurants'][index]
                                                  ['name'],
                                              style: h2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.stars_outlined,
                                                  color: Colors.amber,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  data['restaurants'][index]
                                                          ['rating']
                                                      .toString(),
                                                  style: h4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              data['restaurants'][index]
                                                  ['city'],
                                              style: h4,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
