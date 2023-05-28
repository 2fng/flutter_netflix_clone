import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/search_icon.png'),
            color: Colors.white,
          )
        ],
        title: Image.asset(
          'assets/images/netflix_logo.png',
          height: 36,
        ),
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeScreenHeader(),
            Expanded(
              child: Center(
                child: Text('Hehe'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/demo_banner.webp'),
            fit: BoxFit.cover),
      ),
      child: Stack(children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.95),
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(1)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Demon Slayer',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Lora'),
              ),
              const SizedBox(height: 16),
              const Text('Anime • Action • Adventure'),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButtonWithTextBelow(
                        icon: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        title: 'My list',
                        onPress: () {
                          // ignore: avoid_print
                          print('My list tapped!');
                        },
                      )
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('Play'),
                    icon: const Icon(Icons.play_arrow),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      foregroundColor: Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      IconButtonWithTextBelow(
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        title: 'Info',
                        onPress: () {
                          // ignore: avoid_print
                          print('Info tapped!');
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class IconButtonWithTextBelow extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function()? onPress;
  const IconButtonWithTextBelow(
      {super.key, required this.title, required this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [IconButton(onPressed: onPress, icon: icon), Text(title)],
    );
  }
}
