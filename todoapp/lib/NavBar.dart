import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/ProfilePg.dart';

import 'CompletedTasks.dart';
import 'Settings.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue[50],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Sahil Kamath"),
              accountEmail: Text("sahilkamath0109@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network('https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZSUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80',width: 90,height: 90,),
                ),
              ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&w=600'),fit: BoxFit.cover)
            ),
          ),
          ListTile(
            leading: Icon(Icons.person,color: Colors.blueGrey.shade900,),
            title: Text("Profile",style: TextStyle(fontSize: 16),),
            onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePg())),
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.blueGrey.shade900,),
            title: Text("Settings",style: TextStyle(fontSize: 16),),
            onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => Settings())),
          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.blueGrey.shade900,),
            title: Text("Log-Out",style: TextStyle(fontSize: 16),),
            //onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => CompletedTask())),
          ),
        ],
      ),
    );
  }
}
