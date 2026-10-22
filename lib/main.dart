
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaGarderie());
}

class MaGarderie extends StatelessWidget {
  const MaGarderie({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/garderie.jpg',
              width: 220,
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 25),
            const Text(
              'Ma Garderie',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 12),
            const Text('Bienvenue dans notre garderie'),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> menus = const [
    {
      'id': 1,
      'titre': 'Petit déjeuner',
      'description': 'Lait, céréales et fruits',
      'icone': '🥣',
    },
    {
      'id': 2,
      'titre': 'Déjeuner',
      'description': 'Poulet, riz et légumes',
      'icone': '🍲',
    },
    {
      'id': 3,
      'titre': 'Goûter',
      'description': 'Biscuit et compote de pomme',
      'icone': '🍪',
    },
    {
      'id': 4,
      'titre': 'Jus de fruits',
      'description': "Jus d'orange naturel",
      'icone': '🍊',
    },
    {
      'id': 5,
      'titre': 'Fruits frais',
      'description': 'Une sélection de fruits de saison',
      'icone': '🍎',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Rechercher un menu')),
  );
},
           
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
           onPressed: () {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Aucune notification')),
  );
},
          ),
        ],
      ),

     
drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.deepOrange,
        ),
        child: Center(
          child: Text(
            'Ma Garderie',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Accueil'),
        onTap: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Accueil'),
            ),
          );
        },
      ),

      ListTile(
        leading: const Icon(Icons.restaurant_menu),
        title: const Text('Menus'),
        onTap: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Menus'),
            ),
          );
        },
      ),

      ListTile(
        leading: const Icon(Icons.info),
        title: const Text('À propos'),
        onTap: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('À propos de Ma Garderie'),
            ),
          );
        },
      ),
    ],
  ),
),


      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Menus du jour',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  final menu = menus[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: Text(
                        menu['icone'],
                        style: const TextStyle(fontSize: 36),
                      ),
                      title: Text(
                        menu['titre'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(menu['description']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
       onPressed: () {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Ajouter un menu')),
  );
},
        child: const Icon(Icons.add),
      ),
    );
  }
}
