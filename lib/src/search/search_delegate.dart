import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';
import '../providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate{

  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Shazam!',
    'Thor',
    'Cats'
  ];

  final peliculasRecientes = [
    'Cats',
    'El Hombre Invisible',
    'Batman',
    'Joker'
  ];

  

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones del appbar (limpiar, cancelar, buscar, etc)

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },

      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izq del appbar (la lupa, boton de regresar, etc)

    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias de busqueda
    if(query.isEmpty){
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
     builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {

        if(snapshot.hasData){
          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map((pelicula){
              return ListTile(
                leading: FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'), 
                  image: NetworkImage(pelicula.getPosterImg()),
                  width: 50.0,
                  fit: BoxFit.contain,
              ),
              title: Text(pelicula.title),
              subtitle: Text(pelicula.originalTitle),
              onTap: (){
                close(context, null);
                pelicula.uniqueId = '';
                Navigator.pushNamed(context, 'detalle', arguments: pelicula);
              }, 
              );
          
            }).toList()
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  
  /* @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias de busqueda
    final listaSugerida = (query.isEmpty) ? peliculasRecientes : peliculas.where((p)=> p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context,i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: () {},
        );
      },
    );
  } */

}