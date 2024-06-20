import 'package:flutter/material.dart';

import 'category_model.dart';
import 'category_widget.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<CategoryModel> categories = [];
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return InkWell(
            onTap: () => _onCategorySelected(category),
            child: CategoryWidget(
              isSelected: selectedCategory != null &&
                  selectedCategory!.id == category.id,
              category: category,
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        categories = [
          CategoryModel(
            id: 1,
            name: 'Fruits',
            image:
                'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
            description: 'Fresh fruits',
          ),
          CategoryModel(
            id: 2,
            name: 'Vegetables',
            image:
                'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
            description: 'Fresh vegetables',
          ),
          CategoryModel(
            id: 3,
            name: 'Meat',
            image:
                'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
            description: 'Fresh meat',
          ),
          CategoryModel(
            id: 4,
            name: 'Fish',
            image:
                'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
            description: 'Fresh fish',
          ),
        ];
      });
    });
  }

  void _onCategorySelected(CategoryModel category) {
    // if has select category
    if (selectedCategory != null) {
      if (selectedCategory!.id == category.id) {
        setState(() {
          selectedCategory = null;
        });
      } else {
        // select the category
        setState(() {
          selectedCategory = category;
        });
      }
    } else {
      // select the category
      setState(() {
        selectedCategory = category;
      });
    }
  }
}
