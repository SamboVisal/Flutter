import 'destination_view.dart';
import 'destination.dart';
import 'package:flutter/material.dart';



class _DestinationViewState extends State<DestinationView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Navigator(
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          settings: setting,
          builder: (BuildContext context) {
            switch (setting.name) {
              case '/':
                return RootPage(destination: widget.destination,);
              
            }
          },
        );
      },
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/list");
          },
        ),
      ),
    );
  }
}