import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{
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
    return Container();
  }

}