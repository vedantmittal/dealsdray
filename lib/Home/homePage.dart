import 'package:dealsdray/Home/home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  PageController _controller = PageController();

  void _onTappedBar(int value) {
    _selectedIndex = value;
    _controller.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          Home(),
          Center(
            child: Text('Categories',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text('Deals',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text('Cart',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text('Profile',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      bottomNavigationBar: Footer(
        currentIndex: _selectedIndex,
        onPressed: _onTappedBar,
      ),
    );
  }
}

class Footer extends StatefulWidget {
  final Function(int) onPressed;
  final int currentIndex;

  const Footer({
    Key? key,
    required this.onPressed,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<BTab> _bTab = [
    BTab(
      index: 0,
      tab: 'Home',
      asset1: Icons.home_outlined,
    ),
    BTab(
      index: 1,
      tab: 'Categories',
      asset1: Icons.category_outlined,
    ),
    BTab(
      index: 2,
      tab: 'Deals',
      asset1: Icons.local_offer_outlined,
    ),
    BTab(
      index: 3,
      tab: 'Cart',
      asset1: Icons.shopping_cart_outlined,
    ),
    BTab(
      index: 4,
      tab: 'Profile',
      asset1: Icons.person_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey[50],
          border:
              Border(top: BorderSide(color: Colors.grey[200]!, width: 0.5))),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (BTab i in _bTab.getRange(0, 5))
              BottomTab(
                index: i.index,
                name: i.tab,
                onTap: widget.onPressed,
                asset: i.asset1,
                color: widget.currentIndex == i.index
                    ? Colors.red
                    : Colors.grey[400]!,
              ),
          ],
        ),
      ),
    );
  }
}

class BottomTab extends StatefulWidget {
  final int index;
  final IconData asset;
  final String name;
  final Function(int) onTap;
  final Color color;

  const BottomTab(
      {Key? key,
      required this.index,
      required this.onTap,
      required this.asset,
      required this.name,
      required this.color})
      : super(key: key);

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        widget.onTap(widget.index);
      },
      minWidth: 50,
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.asset,
            color: widget.color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 11, color: widget.color),
            ),
          ),
        ],
      ),
      shape: CircleBorder(),
    );
  }
}

class BTab {
  final IconData asset1;
  final String tab;
  final int index;

  BTab({
    required this.tab,
    required this.index,
    required this.asset1,
  });
}
