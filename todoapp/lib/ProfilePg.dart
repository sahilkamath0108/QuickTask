import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePg extends StatefulWidget {
  const ProfilePg({Key? key}) : super(key: key);

  @override
  State<ProfilePg> createState() => _ProfilePgState();
}

class _ProfilePgState extends State<ProfilePg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
        body: SingleChildScrollView(
          child: Column(
              children: [
              Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 135),
                    child: buildCoverImage()),
                Positioned(top: 295,
                    child:
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4, color: Colors.blueGrey.shade900),
                        shape: BoxShape.circle,

                      ),

                      child: CircleAvatar(
                        radius: 130,
                        // backgroundImage: user.photoURL == null ? NetworkImage("https://image.shutterstock.com/image-vector/person-icon-260nw-282598823.jpg",
                        //     scale: 40) as ImageProvider
                        //     : NetworkImage(user.photoURL!),
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZSUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80',scale: 40),

                      ),
                    )
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    child: (
                        Text(
                      // user.displayName == null ? 'Steve Rogers' : user
                      //     .displayName!,
                      // style: TextStyle(fontSize: 33,
                      //     fontWeight: FontWeight.bold,
                      //     fontFamily: 'Dancingscript')
                          "Sahil Kamath",style: GoogleFonts.abel(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900,fontSize: 23),)
                    ),
                  ),
                ),

              ]

          ),
                SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: double.maxFinite,
                  height: 40,
                  //child: Padding(padding: EdgeInsets.fromLTRB(10,0,10,0)),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blueGrey.shade900),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Icon(Icons.email, color: Colors.blueGrey.shade900),
                      // Text("e-mail: ",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 26,
                      //   ),
                      // ),
                      SizedBox(width: 6,),
                      Text(
                        // user.email == null ? 'user1@gmail.com' : user.email!,
                        // style: TextStyle(
                        //     fontSize: 19,
                        //     fontFamily: 'Trajan Pro'
                        // ),
                        "sahilkamath0109@gmail.com"

                      ),
                    ],
                  ),

                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: double.maxFinite,
                  height: 40,
                  //child: Padding(padding: EdgeInsets.fromLTRB(10,0,10,0)),

                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blueGrey.shade900),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Icon(Icons.phone, color: Colors.blueGrey.shade900,),
                      // Text("Phone: ",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 26,
                      //   ),
                      // ),
                      SizedBox(width: 10,),
                      Text("8928463464", style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Trajan Pro'
                      ),)
                    ],
                  ),

                ),
                SizedBox(
                  height: 20,
                ),

    ]
    )
    )
    );
  }
  Widget buildCoverImage() =>
      Container(
        //color: Colors.grey,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.zero)
        ),
        child: Image.network('https://images.pexels.com/photos/194096/pexels-photo-194096.jpeg?auto=compress&cs=tinysrgb&w=600',fit: BoxFit.cover,),

        height: 475,
      );
}
