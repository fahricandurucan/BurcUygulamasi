import 'package:flutter/material.dart';

import 'model/burc.dart';

import 'package:palette_generator/palette_generator.dart';


class BurcDetay extends StatefulWidget {

  late Burc secilenBurc;
  BurcDetay({required this.secilenBurc});


  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {

  Color appbarRengi = Colors.pink;
  late PaletteGenerator generator ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appbarRenkAyarla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [ //bizden sliver bekliyor
          SliverAppBar(
            expandedHeight: 250,//uygulama açıldığında ne kadarlık yer tutacağını belirledik
            pinned: true, //sabit bi şekilde kalması için yukarı aşağı hareket ettirdiğimizde

            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(widget.secilenBurc.burc_buyuk_resim,fit: BoxFit.cover,),
              title: Text(widget.secilenBurc.burc_ad + "Burcu ve Özellikleri"),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter( //slşver olmayan bir şeyler ekleyebilmek için bu widget içine yazmalıyız
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(widget.secilenBurc.burc_detay,style: TextStyle(fontSize: 18),),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appbarRenkAyarla() async{ //appar rengi değişken hale getirdik(palette_generator kütüphanesini kullanarak)
    generator = await PaletteGenerator.fromImageProvider(AssetImage(widget.secilenBurc.burc_buyuk_resim));
    setState(() {
      appbarRengi = generator.dominantColor!.color;
    });

  }
}
