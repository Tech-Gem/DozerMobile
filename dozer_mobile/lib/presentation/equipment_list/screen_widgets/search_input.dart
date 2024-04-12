import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Search input with rounded rectangular border
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search equipment ...',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Implement search functionality
                },
              ),
            ],
          ),
        ),

        SizedBox(height: 10),

        // Categories selection
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text('Categories: '),
              Expanded(
                child: Wrap(
                  spacing: 8,
                  children: selectedCategories
                      .map((category) => Chip(
                            label: Text(category),
                            onDeleted: () {
                              setState(() {
                                selectedCategories.remove(category);
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
              PopupMenuButton(
                icon: Icon(Icons.filter_list),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry>[
                    PopupMenuItem(
                      child: Text('Category 1'),
                      value: 'Category 1',
                    ),
                    PopupMenuItem(
                      child: Text('Category 2'),
                      value: 'Category 2',
                    ),
                    // Add more categories as needed
                  ];
                },
                onSelected: (selectedCategory) {
                  setState(() {
                    selectedCategories.add(selectedCategory as String);
                  });
                },
              ),
            ],
          ),
        ),

        SizedBox(height: 10),

        // Search button with primary color
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: ElevatedButton(
            onPressed: () {
              // Implement search functionality
            },
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Theme.of(context).primaryColor),
              ),
            ),
            child: Text('Search'),
          ),
        ),
      ],
    );
  }
}
