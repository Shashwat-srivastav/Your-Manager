// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'MyData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    loaddata();
  }

  loaddata() async {
    final String dataJson =
        await rootBundle.loadString("lib/assets/files/data.json");
    final datadart = jsonDecode(dataJson);
    var d = datadart["data"];
    MyData.detail = List.from(d).map<data>((de) => data.fromMap(de)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(CupertinoIcons.plus,
              color: Colors.deepPurple[100], size: 40),
        ),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 250, 0),
                  child: "Your"
                      .text
                      .color(Colors.deepPurple[300])
                      .xl6
                      .bold
                      .make()),
              Container(
                  padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                  child: "Manager"
                      .text
                      .color(Colors.deepPurple[300])
                      .xl6
                      .bold
                      .make()
                      .p20()),
              GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: MyData.detail.length,
                itemBuilder: (context, index) {
                  final data det = MyData.detail[index];
                  return MyBoxes(d: det);
                },
              ),
            ]),
          ),
        ));
  }
}

class MyBoxes extends StatelessWidget {
  final data d;
  const MyBoxes({
    Key? key,
    required this.d,
  })  : assert(d != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => DetailPage(det: d))));
      },
      child: Card(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(12),
          elevation: 10,
          shadowColor: Colors.deepPurple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          // color: Colors.blueGrey[200],
          child: Column(
            children: [
              d.name.text.bold.color(Colors.blueGrey[400]).xl2.make().p12(),
              VxBox(
                  child: Hero(
                      tag: Key(d.id),
                      child: Image.network(
                        d.Bcolor,
                        height: 128,
                        width: 180,
                      ))).make()
              // Icon(CupertinoIcons.shopping_cart,
              //     size: 100, color: Colors.blueGrey[400])
            ],
          )),
    );
    // VxBox(
    //     child: Column(children: [
    //   "Groceries".text.bold.green600.xl3.make().p12(),
    //   Icon(CupertinoIcons.shopping_cart,
    //       size: 100, color: Colors.green[600])
    // ])).height(10).green200.roundedLg.make().p12(),

    // );
  }
}

class DetailPage extends StatelessWidget {
  final data det;
  const DetailPage({
    Key? key,
    required this.det,
  })  : assert(det != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(CupertinoIcons.plus)),
      appBar: AppBar(),
      backgroundColor: context.cardColor,
      body: SafeArea(
        child: Column(
          children: [
            // "hello".text.make(),
            Hero(tag: Key(det.id), child: Image.network(det.Bcolor)),
            Expanded(
                child: VxArc(
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              height: 40,
              child: Container(
                  width: context.screenWidth,
                  color: Colors.deepPurple[100],
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 10, 0),
                    child: Column(children: [
                      det.name.text.xl4.make().p1(),
                      SizedBox(height: 400, child: MyCardView())
                      // child: det.name.text.xl4.make().p64()
                    ]),
                  )),
            ))
            // Image.network(det.Bcolor),
          ],
        ),
      ),
    );
  }
}

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
          return VxBox(
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "Item name".text.bold.xl2.make(),
                "\$999".text.xl3.color(Colors.red[500]).make()
              ],
            ),
          ).rounded.color(Colors.white).make().h10(context).p12();
        }));
  }
}

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [],
    ));
  }
}
