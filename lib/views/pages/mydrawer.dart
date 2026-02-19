import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final String? trailingtext;
  final bool hasDivider;

  DrawerItem({
    required this.title,
    required this.icon,
    this.iconColor,
    this.trailingtext,
    this.hasDivider = false,
  });
}

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> menuItems = [
      DrawerItem(
        title: 'theme',
        icon: Icons.workspace_premium,
        iconColor: Colors.orangeAccent,
      ),
      DrawerItem(title: 'tags', icon: Icons.label_important_outline),
      DrawerItem(
        title: 'DiaryLock',
        icon: Icons.lock_outline,
        hasDivider: true,
      ),
      DrawerItem(title: 'Share App', icon: Icons.share_outlined),
      DrawerItem(
        title: 'Follow Us',
        icon: Icons.facebook,
        iconColor: Colors.blueAccent,
      ),
      DrawerItem(title: 'Help Center', icon: Icons.help_outlined),
    ];
    return Drawer(
      backgroundColor:Color(0xFF0D1B38),
      child: Column(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('assets/images/heart.jpg'),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: menuItems.length,
                 separatorBuilder: (context, index) => menuItems[index].hasDivider
                  ? Divider(color: Colors.white, height: 1)
                  : SizedBox.shrink(),
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return ListTile(
                  leading: Icon(item.icon ,color: item.iconColor ?? Colors.white),
                  title: Row(
                    children: [
                      Text(item.title,style: TextStyle(color: Colors.white),),
                      if(item.trailingtext!=null)...[
                        SizedBox(width: 8),
                        Text(item.trailingtext!,style: TextStyle(color:Colors.white10),),
                      ]
                    ],
                  ),
                  onTap: () {
                    
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
