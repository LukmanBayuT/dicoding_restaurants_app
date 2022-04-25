import 'package:flutter/material.dart';
import 'package:newsapp/const/const.dart';

class DetailedPagesRestaurantsLocalJson extends StatelessWidget {
  var details;

  DetailedPagesRestaurantsLocalJson({Key? key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(details['menus']['foods']);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Image.network(
                details['pictureId'],
                fit: BoxFit.cover,
                width: 500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details['name'],
                        style: h1,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_city),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            details['city'],
                            style: h4,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi Singkat',
                        style: h2,
                      ),
                      Card(
                        shape: boraci20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            details['description'],
                            style: h5,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Foods',
                    style: h2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: details['menus']['foods'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/foods.png',
                                  width: 50,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  details['menus']['foods'][index]['name'],
                                  style: h5,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Drinks',
                    style: h2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: details['menus']['drinks'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/drinks.png',
                                  width: 50,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  details['menus']['drinks'][index]['name'],
                                  style: h5,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
