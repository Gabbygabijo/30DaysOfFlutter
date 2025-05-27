/*
count:1302
next:"https://pokeapi.co/api/v2/pokemon?offset=30&limit=10"
previous:"https://pokeapi.co/api/v2/pokemon?offset=10&limit=10"
results: [
  {
    name:"spearow"
    url:"https://pokeapi.co/api/v2/pokemon/21/"
  }
  {
    name:"fearow"
    url:"https://pokeapi.co/api/v2/pokemon/22/"
  }
]
*/

class PokemonListing {
  final int id;
  final String name;

  PokemonListing({required this.id, required this.name});

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'];
    final id = int.parse(url.split('/')[6]);

    return PokemonListing(id: id, name: name);
  }
}

class PokemonPageResponse {}