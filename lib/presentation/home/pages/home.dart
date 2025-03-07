
import 'package:flutter/material.dart';
import 'package:simple_ecommerce_firebase/presentation/home/widgets/categories.dart';
import 'package:simple_ecommerce_firebase/presentation/home/widgets/header.dart';
import 'package:simple_ecommerce_firebase/presentation/home/widgets/new_in.dart';
import 'package:simple_ecommerce_firebase/presentation/home/widgets/search_field.dart';
import 'package:simple_ecommerce_firebase/presentation/home/widgets/top_selling.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [
            Header(),
            SearchField(),
            Categories(),
            TopSelling(),
            NewIn()
          ],
        ),
      ),
    );
  }
}