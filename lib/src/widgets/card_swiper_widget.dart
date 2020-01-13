import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final List<dynamic> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      
      child: Swiper(
          itemWidth: _screenSize.width * 0.7, //el 70% del ancho del dispositivo
          itemHeight: _screenSize.height * 0.5, //el 50% del alto del dispositivo
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child:Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,),

            );
          },
          itemCount: peliculas.length,
          //pagination: new SwiperPagination(),
          //control: new SwiperControl(),
          layout: SwiperLayout.STACK,
          
        ),
    );
  }
}