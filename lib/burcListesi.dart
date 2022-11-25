import 'package:burc_uygulamasi/burc.dart';
import 'package:burc_uygulamasi/data/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;

  BurcListesi(){
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burçlar Listesi"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: tumBurclar.length,
            itemBuilder: (context,indeks){
              var burc = tumBurclar[indeks];
              return Container(
                child: SizedBox(
                  height: 80,
                  child: Card(
                    elevation: 5,
                    shadowColor: Colors.pinkAccent,
                    child: Row(
                      children: [

                        SizedBox(
                          height: 50,
                          child: Image.asset(burc.burc_kucuk_resim),
                        ),
                        Container(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(burc.burc_ad,style: TextStyle(fontSize: 20),),
                            Text(burc.burc_tarih,style: TextStyle(fontSize: 16),)
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.arrow_forward_ios,color: Colors.pink,),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for(int i = 0;i<12;i++){
      Burc eklenecekBurc = Burc(Strings.burc_adlari[i], Strings.burc_tarihleri[i],
          Strings.burc_detayi[i], (Strings.burc_adlari[i].toLowerCase()+ "${i+1}.png"),
          (Strings.burc_adlari[i].toLowerCase()+ "_buyuk${i+1}.png"));
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
