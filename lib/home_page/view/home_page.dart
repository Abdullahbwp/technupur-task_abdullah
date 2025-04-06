import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../view_model/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final HomePageProvider provider =
        Provider.of<HomePageProvider>(context, listen: false);
    provider.get_category_info();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomePageProvider provider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/svgs/drawer_icon.svg'),
        ),
        title: SvgPicture.asset('assets/svgs/Logo.svg'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/svgs/search_icon.svg'),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: provider.homePageModel!.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                Divider(
                  height: 5,
                  thickness: 0.7,
                ),
                SizedBox(
                  height: 10,
                ),
                CategoryTabs(),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 5,
                  thickness: 0.7,
                ),
                SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10),
                const CategoryCircles(),
                const SizedBox(height: 10),
                const ProductSection(),
                const SizedBox(height: 20),
                Image.asset('assets/images/Banner Style.png')
              ],
            ),
    );
  }
}

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({super.key});

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  @override
  Widget build(BuildContext context) {
    final HomePageProvider provider = Provider.of<HomePageProvider>(context);
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.homePageModel?.length ?? 0,
        padding: EdgeInsets.only(top: 5),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              provider.select_main_category(selected_index: index);
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 1,
                          color: provider.selected_main_category_id !=
                                  provider.homePageModel?[index].id
                              ? Color(0xffD9E4E8)
                              : Color(0xffB9202B))),
                  child: Center(
                      child: Text(provider.homePageModel?[index].name ?? '')),
                ),
                Positioned(
                  right: 6,
                  top: 0,
                  child: Transform.translate(
                    offset: Offset(0, -5),
                    child: Container(
                      padding: EdgeInsets.all(1.5),
                      child: Text(
                        '${provider.homePageModel?[index].subCategory!.length ?? ''}',
                        style: TextStyle(
                            fontSize: 7,
                            color: provider.selected_main_category_id !=
                                    provider.homePageModel?[index].id
                                ? Color(0xffD9E4E8)
                                : Color(0xffB9202B)),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                              width: 1,
                              color: provider.selected_main_category_id !=
                                      provider.homePageModel?[index].id
                                  ? Color(0xffD9E4E8)
                                  : Color(0xffB9202B))),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryCircles extends StatelessWidget {
  const CategoryCircles({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageProvider provider = Provider.of<HomePageProvider>(context);
    int i_main = provider.homePageModel!
        .indexWhere((v) => v.id == provider.selected_main_category_id);
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.homePageModel![i_main].subCategory!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              provider.select_sub_category(selected_index: index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: provider.homePageModel![i_main]
                                      .subCategory![index].id ==
                                  provider.selected_main_sub_category_id
                              ? LinearGradient(
                                  colors: [
                                    Colors.pink,
                                    Colors.orange,
                                    Colors.yellow
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                )
                              : LinearGradient(
                                  colors: [
                                    Color(0xffD9E4E8),
                                    Color(0xffD9E4E8),
                                    Color(0xffD9E4E8)
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                ),
                        ),
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          radius: 30,
                          child: Image.network(provider.homePageModel![i_main]
                                  .subCategory![index].image ??
                              ''),
                        ),
                      ),
                      Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1,
                                color: provider.homePageModel![i_main]
                                            .subCategory![index].id !=
                                        provider.selected_main_sub_category_id
                                    ? Color(0xffD9E4E8)
                                    : Color(0xffB9202B))),
                        child: Center(
                          child: Text(
                            '${provider.homePageModel![i_main].subCategory![index].products!.length}',
                            style:
                                const TextStyle(fontSize: 7, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(provider.homePageModel![i_main].subCategory![index].name ??
                      ''),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductSection extends StatefulWidget {
  const ProductSection({super.key});

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    final HomePageProvider provider = Provider.of<HomePageProvider>(context);
    int i_main = provider.homePageModel!
        .indexWhere((v) => v.id == provider.selected_main_category_id);
    int i_sub = provider.homePageModel![i_main].subCategory!
        .indexWhere((v) => v.id == provider.selected_main_sub_category_id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('Products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(
              width: 5,
            ),
            Text(
                '(${provider.homePageModel![i_main].subCategory![i_sub].name})',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Color(0xffB9202B)))
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: provider
                .homePageModel![i_main].subCategory![i_sub].products!
                .map((product) {
              return Stack(
                children: [
                  Container(
                    width: 160,
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Image.network(product.image ?? ''),
                        const SizedBox(height: 10),
                        Text(
                          '${product.name}',
                          style: TextStyle(color: Color(0xff89999F)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                '\$${(product.price! / (1 - product.discountPercentage! / 100)).toStringAsFixed(1)}',
                                style: TextStyle(
                                    color: Color(0xff89999F),
                                    decoration: TextDecoration.lineThrough)),
                            SizedBox(
                              width: 5,
                            ),
                            Text('\$${product.price}',
                                style: const TextStyle(color: Colors.red)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        if (product.quantity == 0)
                          SvgPicture.asset('assets/svgs/sold_out_btn.svg'),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: Center(
                        child: Text(
                          '${product.discountPercentage}%',
                          style: TextStyle(fontSize: 9, color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(color: Colors.green),
                    ),
                    top: 25,
                    left: 20,
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
