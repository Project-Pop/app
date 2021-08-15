import 'package:app/UI/Views/HomeBase/Profile/widgets/pop_view_grid_widget.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:app/UI/Views/SignUp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.popList}) : super(key: key);
  final List<String> popList;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            FlutterIcons.info_circle_faw,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: const MyText(
          msg: 'APP NAME',
          textStyle: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FlutterIcons.fire_mco,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 12),
                    child: const MyText(
                      msg: '0',
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: MyText(
                  msg: 'Invite Some Friends',
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green.shade800),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {},
                    child: const MyText(
                      msg: 'Share Invities',
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 18.0),
                child: DyamicGridView(
                  isMinePop: true,
                  popList: widget.popList,
                  isHome: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
