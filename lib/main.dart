// @dart=2.9
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int sayac = 0;
  
  Future<void> sayacKontrol() async{
    var sp = await SharedPreferences.getInstance();
    
    sayac = sp.getInt("sayac") ?? 0 ;
    
    setState(() {
      sayac = sayac+1;
    });
    
    sp.setInt("sayac", sayac);
  }

  @override
  void initState() {
    super.initState();
    sayacKontrol();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sayac"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Açılış Sayısı : $sayac",style: TextStyle(fontSize: 50),),
          ],
        ),
      ),

    );
  }
}
