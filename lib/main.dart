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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeScreenHeader(),
            MovieImage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/coming_soon.png'),
              label: 'Coming soon'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.download), label: 'My List'),
        ],
        backgroundColor: Colors.transparent,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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

class MovieImage extends StatelessWidget {
  const MovieImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(children: [
        SizedBox(height: 32),
        MovieImageCell(
          title: 'My List',
        ),
        MovieImageCell(
          title: 'New Releases',
        ),
        MovieImageCell(
          title: 'Popular',
        ),
      ]),
    );
  }
}

class MovieImageCell extends StatelessWidget {
  const MovieImageCell({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w800,
                fontSize: 16),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 168,
          child: ListView.builder(
              padding: const EdgeInsets.only(right: 8),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Wrap(children: [
                  InkWell(
                    onTap: () {
                      print('Image in ${title} tapped!');
                    },
                    splashColor: Colors.white10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/demo_banner.webp',
                        height: 160,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ]);
              }),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
