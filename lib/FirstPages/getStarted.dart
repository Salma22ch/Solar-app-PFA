import 'package:flutter/material.dart';

class getStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      body: PageView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return SliderTile(
              "assets/getStartedShape.png", "APP Name", "Description ");
        },
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String image, title, desc;
  SliderTile(this.image, this.title, this.desc);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var primaryColor = Theme.of(context).primaryColor;
    var accentColor = Theme.of(context).accentColor;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(image),
              Image.asset("getStartedAmpoule.png"),
            ],
          ),
          SizedBox(height: 60),
          Text(
            title,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color: primaryColor,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Text(
              desc,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: accentColor,
              ),
            ),
          ),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: accentColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
                minimumSize: Size(MediaQuery.of(context).size.width - 40, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          ),
        ],
      ),
    );
  }
}
