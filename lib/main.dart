
// Importation de la bibliothèque Timer pour gérer le temps
import 'dart:async';
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

// Importation des widgets et des composants Flutter
import 'package:flutter/material.dart';

// Fonction principale : point de départ de l'application
void main() {
  // Lance l'application MaGarderie
  runApp(const MaGarderie());
}

// Classe principale de l'application
// StatelessWidget : le contenu ne change pas directement avec un état
class MaGarderie extends StatelessWidget {
  const MaGarderie({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp permet de configurer l'application
    return const MaterialApp(
      // Masque la bannière DEBUG en haut de l'écran
      debugShowCheckedModeBanner: false,

      // Définit SplashScreen comme premier écran
      home: SplashScreen(),
    );
  }
}

// Écran de démarrage de l'application
// StatefulWidget : permet de gérer un état et le cycle de vie
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// Classe qui contient l'état et le comportement du SplashScreen
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // Appelle la méthode initState de la classe parente
    super.initState();

    // Attend 3 secondes avant de passer à la page d'accueil
    Timer(const Duration(seconds: 3), () {

      // Vérifie que le widget existe toujours avant la navigation
      if (!mounted) return;

      // Remplace le SplashScreen par la page d'accueil
      // L'utilisateur ne revient pas au SplashScreen avec le bouton Retour
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          // Définit HomePage comme destination
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold fournit la structure de base de l'écran
    return Scaffold(
      // Définit une couleur de fond orange très claire
      backgroundColor: Colors.orange.shade50,

      // Centre le contenu horizontalement et verticalement
      body: Center(
        child: Column(
          // Centre les éléments verticalement dans la colonne
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // Affiche l'image de la garderie depuis les assets
            Image.asset(
              'assets/garderie.jpg',
              width: double.infinity, // Largeur de l'image
              height:double.infinity, // Hauteur de l'image
              fit: BoxFit.cover, // Remplit la zone de l'image
            ),

            // Ajoute un espace vertical de 25 pixels
            const SizedBox(height: 25),

            // Affiche le nom de l'application
            const Text(
              'Ma Garderie',
              style: TextStyle(
                fontSize: 30, // Taille du texte
                fontWeight: FontWeight.bold, // Texte en gras
                color: Colors.deepOrange, // Couleur du texte
              ),
            ),

            // Ajoute un espace vertical de 12 pixels
            const SizedBox(height: 12),

            // Affiche un message de bienvenue
            const Text('Bienvenue dans notre garderie'),
          ],
        ),
      ),
    );
  }
}

// Page d'accueil de l'application
// StatelessWidget : les données affichées sont définies dans la classe
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Liste des menus sous forme de Map
  // Chaque Map contient l'identifiant, le titre, la description et l'icône
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
    // Scaffold organise les différentes parties de la page
    return Scaffold(

      // Barre supérieure de l'application
      appBar: AppBar(
        // Titre affiché dans la barre supérieure
        title: const Text('Ma Garderie'),

        // Couleur de fond de l'AppBar
        backgroundColor: Colors.deepOrange,

        // Couleur des icônes et du texte
        foregroundColor: Colors.white,

        // Boutons placés à droite de l'AppBar
        actions: [

          // Bouton de recherche
          IconButton(
            icon: const Icon(Icons.search),

            // Affiche un message en bas de l'écran au clic
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Rechercher un menu'),
                ),
              );
            },
          ),

          // Bouton des notifications
          IconButton(
            icon: const Icon(Icons.notifications),

            // Affiche un message indiquant l'absence de notifications
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Aucune notification'),
                ),
              );
            },
          ),
        ],
      ),

      // Menu latéral qui s'ouvre depuis le bord de l'écran
      drawer: Drawer(
        child: ListView(
          // Supprime l'espace intérieur par défaut en haut de la liste
          padding: EdgeInsets.zero,

          children: [

            // En-tête du menu latéral
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),

              // Centre le titre dans l'en-tête
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

            // Élément du menu : Accueil
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),

              // Ferme le Drawer et affiche un message
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Accueil'),
                  ),
                );
              },
            ),

            // Élément du menu : Menus
            ListTile(
              leading: const Icon(Icons.restaurant_menu),
              title: const Text('Menus'),

              // Ferme le Drawer et affiche un message
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Menus'),
                  ),
                );
              },
            ),

            // Élément du menu : À propos
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),

              // Ferme le Drawer et affiche un message
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

      // Corps principal de la page
      body: Padding(
        // Ajoute une marge intérieure de 16 pixels
        padding: const EdgeInsets.all(16),

        child: Column(
          // Aligne les éléments au début horizontalement
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // Titre de la section des menus
            const Text(
              'Menus du jour',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Espace vertical de 12 pixels
            const SizedBox(height: 12),

            // Expanded occupe l'espace restant disponible
            Expanded(

              // Construit la liste des menus de manière dynamique
              child: ListView.builder(

                // Nombre d'éléments à afficher
                itemCount: menus.length,

                // Construit chaque élément selon son index
                itemBuilder: (context, index) {

                  // Récupère le menu correspondant à l'index
                  final menu = menus[index];

                  // Card affiche chaque menu dans une carte
                  return Card(
                    // Espace sous chaque carte
                    margin: const EdgeInsets.only(bottom: 12),

                    // Organise l'icône, le titre et la description
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),

                      // Affiche l'emoji du menu à gauche
                      leading: Text(
                        menu['icone'],
                        style: const TextStyle(fontSize: 36),
                      ),

                      // Affiche le titre du menu
                      title: Text(
                        menu['titre'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Affiche la description du menu
                      subtitle: Text(menu['description']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bouton flottant en bas de l'écran
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,

        // Affiche un message au clic sur le bouton +
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ajouter un menu'),
            ),
          );
        },

        // Icône affichée au centre du bouton
        child: const Icon(Icons.add),
      ),
    );
  }
}
