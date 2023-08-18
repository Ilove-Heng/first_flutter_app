import 'package:flutter/material.dart';
import "grid_example.dart";

// void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Positioned myImages(String images) {
    return Positioned(
      top: 0.0,
      left: 100.0,
      child: Container(
        width: 160.0,
        height: 160.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(images),
          ),
        ),
      ),
    );
  }

  Center profilePage(String profileName, String jobDescription,
      String? localtion, String followerVal, String webLink) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff985de3),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 111, 85, 144),
                Color.fromARGB(255, 93, 227, 156),
              ],
              begin: Alignment.centerRight,
              end: Alignment(-1.0, -1.0),
            ),
          ),
          child: Container(
            width: 500.0,
            height: 400.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color(0xff985de3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyApp.appTitle,
      home: MyHomePage(title: MyApp.appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
                  return GridWidget();
                }),
              );
            },
          )
        ],
      ),
      body: Container(
        height: 700.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 700.0,
              width: 400.0,
              color: Color(0xff985de3),
              child: Stack(
                children: <Widget>[
                  profilePage("Pho Sokphorn", "Flutter Developer"),
                  myImages(
                    "https://i.pinimg.com/564x/bf/e9/7c/bfe97ce7c40a81cd4739ebbf0333e080.jpg",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Person'),
              trailing: Icon(
                Icons.arrow_forward,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Person Dialog'),
                      content: Text('Person tile tapped'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
                // Show snack bar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Product Category'),
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
