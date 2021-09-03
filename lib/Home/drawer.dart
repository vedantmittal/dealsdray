import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[800]!,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Welcome to Shop Name",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "customer@dealsdray.com",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const ItemTile(
            title: "Home",
            icon: Icons.home,
          ),
          const ItemTile(
            title: "My Orders",
            icon: Icons.assignment,
          ),
          const ItemTile(
            title: "Buy Again",
            icon: Icons.assignment,
          ),
          const ItemTile(
            title: "Profile",
            icon: Icons.person,
          ),
          const ItemTile(
            title: "Request for Quote",
            icon: Icons.request_page,
          ),
          Divider(thickness: 8),
          const ItemTile(
            title: "Register as Vendor",
            icon: Icons.app_registration,
          ),
          const ItemTile(
            title: "Feedback",
            icon: Icons.feedback,
          ),
          const ItemTile(
            title: "Support",
            icon: Icons.support,
          ),
          const ItemTile(
            title: "About DealsDray",
            icon: Icons.info,
          ),
          const ItemTile(
            title: "Terms & Conditions",
            icon: Icons.description,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Text(
              "V15.987 for DealsDray",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[400],
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey[800],
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
