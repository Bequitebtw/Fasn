import 'package:fasn/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Notifications",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins"),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    prototypeItem: ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      selectedColor: Colors.white,
                      leading: Icon(Icons.notifications_sharp),
                      title: Text(
                        'Notification 1',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text('First not'),
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.notifications_sharp),
                        title: Text('Notification 1',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text('This is a notification',
                            style: TextStyle(color: Colors.white)),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      "Delete all",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ));
  }
}
