

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyTab extends StatefulWidget {
  final RxList tabs, pages;
  const EasyTab({super.key, required this.tabs, required this.pages});

  @override
  State<EasyTab> createState() => _EasyTabState();
}

class _EasyTabState extends State<EasyTab> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < widget.tabs.length; i++)
                  GestureDetector(
                    onTap: () => _onTabSelected(i),
                    child: _buildTabItem(i, _selectedIndex == i, widget.tabs[i]),
                  ),
              ],
            ),
          ),
          // Content area for each tab
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, bool isSelected, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      decoration: BoxDecoration(
        border: isSelected
            ? Border(
                bottom: BorderSide(width: 2.0, color: Colors.blue),
              )
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildContent() {
    print(widget.pages.indexed.first);
    if (_selectedIndex == widget.pages.indexOf(widget.pages[_selectedIndex])) {
      return widget.pages[_selectedIndex];
    } else {
      return Container();
    }
  }
}