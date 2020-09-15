import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:traveldairy/Screens/Add_Place_Screen.dart';
import 'package:traveldairy/Provider/Places_Provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                    child: Text("Got no places yet, start adding some!")),
                builder: (ctx, greatPlaces, ch) =>
                    greatPlaces.getitems.length <= 0
                        ? ch
                        : ListView.builder(
                            itemCount: greatPlaces.getitems.length,
                            itemBuilder: (ctx, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                    greatPlaces.getitems[index].image),
                              ),
                              title: Text(greatPlaces.getitems[index].title),
                              onTap: () {
                                //Go to details page....
                              },
                            ),
                          ),
              ),
      ),
    );
  }
}
