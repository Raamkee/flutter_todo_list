import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  createState() => new NavigationDrawerState();
}

class NavigationDrawerState extends State<NavigationDrawer> {
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child:
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(15.0),
            //             child: Center(child: _cardUserDetailsLeft()),
            //           ),
            //           ListTile(
            //             leading: Icon(
            //               Icons.home,
            //               color: Colors.grey,
            //             ),
            //             title: Text(
            //               'Home',
            //               style: TextStyle(
            //                   color: Colors.black54,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 18),
            //             ),
            //           ),
            //           ListTile(
            //             leading: Icon(
            //               Icons.search,
            //               color: Colors.grey,
            //             ),
            //             title: Text(
            //               'Search',
            //               style: TextStyle(
            //                   color: Colors.black54,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 18),
            //             ),
            //           ),
            //           ListTile(
            //             leading: Icon(
            //               Icons.delete,
            //               color: Colors.grey,
            //             ),
            //             title: Text(
            //               'Trash',
            //               style: TextStyle(
            //                   color: Colors.black54,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 18),
            //             ),
            //           ),
            //           ListTile(
            //             leading: Icon(
            //               Icons.settings,
            //               color: Colors.grey,
            //             ),
            //             title: Text(
            //               'Settings',
            //               style: TextStyle(
            //                   color: Colors.black54,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 18),
            //             ),
            //           ),
            //           ListTile(
            //             leading: Icon(
            //               Icons.info_outline,
            //               color: Colors.grey,
            //             ),
            //             title: Text(
            //               'About',
            //               style: TextStyle(
            //                   color: Colors.black54,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 18),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     ListTile(
            //       leading: Icon(
            //         Icons.power_settings_new,
            //         color: Colors.black54,
            //       ),
            //       title: Text(
            //         'Sign Out',
            //         style: TextStyle(
            //             color: Colors.black54,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18),
            //       ),
            //     ),
            //   ],
            // ),

            // _drawerLeftOrganised(),
            _drawerCenterOrganised(),
      ),
    );
  }

  Widget _cardUserDetailsCenter() {
    return Visibility(
      visible: true,
      child: new Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 10, 3, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      replacement: new Text("Not visible data"),
    );
  }

  Widget _cardUserDetailsLeft() {
    return Visibility(
      visible: true,
      child: new Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 10, 3, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Ramakrishnan',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      subtitle: Text(
                        'App Developer',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      replacement: new Text("Not visible data"),
    );
  }

  Widget _cardProfile() {
    return Visibility(
        visible: true,
        child: new Container(
          // alignment: Alignment.center,
          height: MediaQuery.of(context).size.width / 9.5,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            // color: ThemeConfig.lightPrimary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 18,
                )
              ],
            ),
          ),
        ));
  }

  // Widget _cardDailyReport() {
  //   return Visibility(
  //       visible: true,
  //       child: new Container(
  //         // alignment: Alignment.center,
  //         height: MediaQuery.of(context).size.width / 9.5,
  //         width: MediaQuery.of(context).size.width * 1,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(7),
  //           // color: ThemeConfig.lightPrimary,
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Expanded(
  //                 child: Text(
  //                   'Daily Report',
  //                   style: TextStyle(
  //                     color: ThemeConfig.lightPrimary,
  //                     fontSize: 18,
  //                   ),
  //                 ),
  //               ),
  //               Icon(
  //                 Icons.arrow_forward_ios,
  //                 color: ThemeConfig.lightPrimary,
  //                 size: 18,
  //               )
  //             ],
  //           ),
  //         ),
  //       ));
  // }

  // Widget _cardViewReport() {
  //   return Visibility(
  //       visible: true,
  //       child: new Container(
  //         // alignment: Alignment.center,
  //         height: MediaQuery.of(context).size.width / 9.5,
  //         width: MediaQuery.of(context).size.width * 1,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(7),
  //           // color: ThemeConfig.lightPrimary,
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Expanded(
  //                 child: Text(
  //                   'View Report',
  //                   style: TextStyle(
  //                     color: ThemeConfig.lightPrimary,
  //                     fontSize: 18,
  //                   ),
  //                 ),
  //               ),
  //               Icon(
  //                 Icons.arrow_forward_ios,
  //                 color: ThemeConfig.lightPrimary,
  //                 size: 18,
  //               )
  //             ],
  //           ),
  //         ),
  //       ));
  // }

  Widget _drawerCenterOrganised() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(child: _cardUserDetailsCenter()),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Trash',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'About',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.power_settings_new,
                color: Colors.black54,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Exit',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _drawerLeftOrganised() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(child: _cardUserDetailsLeft()),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                title: Text(
                  'Search',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                title: Text(
                  'Trash',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.grey,
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.power_settings_new,
            color: Colors.black54,
          ),
          title: Text(
            'Sign Out',
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
      ],
    );
  }
}
