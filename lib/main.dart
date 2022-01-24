import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tinder_clone_app/model/user.dart';
import 'package:tinder_clone_app/widget/tinder_card.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Tinder Clone';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              primary: Colors.white,
              shape: CircleBorder(),
              minimumSize: Size.square(80),
            ),
          ),
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final user = User(
    name: 'Steffi',
    age: 20,
    urlImage:
        'https://images.unsplash.com/photo-1612282130134-49784d98ac61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2118&q=80',
  );

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red.shade200,
              Colors.black,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  buildLogo(),
                  const SizedBox(height: 16),
                  Expanded(child: TinderCard(user: user)),
                  const SizedBox(height: 16),
                  buildButtons(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildLogo() => Row(
        children: [
          Icon(
            Icons.local_fire_department_rounded,
            color: Colors.white,
            size: 36,
          ),
          const SizedBox(width: 4),
          Text(
            'Tinder',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      );

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: getColor(Colors.red, Colors.white),
              backgroundColor: getColor(Colors.white, Colors.red),
              side: getBorder(Colors.red, Colors.white),
            ),
            child: Icon(Icons.clear, size: 46),
            onPressed: () {},
          ),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: getColor(Colors.blue, Colors.white),
              backgroundColor: getColor(Colors.white, Colors.blue),
              side: getBorder(Colors.blue, Colors.white),
            ),
            child: Icon(Icons.star, size: 40),
            onPressed: () {},
          ),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: getColor(Colors.teal, Colors.white),
              backgroundColor: getColor(Colors.white, Colors.teal),
              side: getBorder(Colors.teal, Colors.white),
            ),
            child: Icon(Icons.favorite, size: 40),
            onPressed: () {},
          ),
        ],
      );

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorder(Color color, Color colorPressed) {
    final getBorder = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(color: Colors.transparent);
      } else {
        return BorderSide(color: color, width: 2);
      }
    };

    return MaterialStateProperty.resolveWith(getBorder);
  }
}
