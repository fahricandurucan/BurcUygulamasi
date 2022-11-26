import 'package:flutter/material.dart';

import 'model/burc.dart';

class BurcDetay extends StatelessWidget {

  late Burc secilenBurc;
  BurcDetay({required this.secilenBurc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [ //bizden sliver bekliyor
          SliverAppBar(
            expandedHeight: 250,//uygulama açıldığında ne kadarlık yer tutacağını belirledik
            pinned: true, //sabit bi şekilde kalması için yukarı aşağı hareket ettirdiğimizde
            title: Text(secilenBurc.burc_ad),
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(background: Image.asset(secilenBurc.burc_buyuk_resim)),
          ),
          SliverToBoxAdapter( //slşver olmayan bir şeyler ekleyebilmek için bu widget içine yazmalıyız
            child: SingleChildScrollView(
              child: Text(secilenBurc.burc_detay,style: TextStyle(fontSize: 18),),
            ),
          )
        ],
      ),
    );
  }
}
