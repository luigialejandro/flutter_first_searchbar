import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      );
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Algeria',
    'Argentina',
    'Belgium',
    'Bolivia',
    'Brazil',
    'Cameroon',
    'Canada',
    'Chile',
    'China',
    'Colombia',
    'Costa Rica',
    'Croatia',
    'Denmark',
    'El Salvador',
    'Egypt',
    'Ethiopia',
    'Finland',
    'France',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Ireland',
    'Italy',
    'Japan',
    'Mexico',
    'Morocco',
    'Netherlands',
    'Nicaragua',
    'Nigeria',
    'Norway',
    'Panama',
    'Poland',
    'Portugal',
    'Romania',
    'Russia',
    'Senegal',
    'Singapore',
    'South Africa',
    'South Korea',
    'Spain',
    'Sweden',
    'Switzerland',
    'Thailand',
    'UK',
    'Ukraine',
    'Uruguay',
    'USA',
    'Vietnam',
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Container();
  //Center(
  //  child: Text(query, style: const TextStyle(fontSize: 64)),
  //);

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            showResults(context);
          },
        );
      },
    );
  }
}
