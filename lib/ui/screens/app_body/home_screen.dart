import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:untitled/ui/screens/app_body/basket.dart';
import 'package:untitled/ui/screens/app_body/single_product.dart';
import 'package:untitled/view_model/cart_view_model.dart';
import '../../../view_model/products_view_model.dart';
import '../../../view_model/single_product_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartModel = context.read<CartViewModel>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Provider<CartViewModel>(
                        child: const Basket(), create: (_) => CartViewModel()),
                  ));
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Center(
              child: Text(
                '${cartModel.count}',
              ),
            ),

          ),
          Text(
            '${cartModel.totalPrice}',
          ),
        ],
        backgroundColor: const Color(0xff2D46B9),
        title: const Text(
          'All Products',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: const MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    final allProducts = viewModel.product?.data ?? [];
    if (allProducts.isNotEmpty) {
      return GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: allProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          var product = allProducts[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MultiProvider(providers: [
                  Provider<SingleProductViewModel>(
                      create: (_) =>
                          SingleProductViewModel(singleProduct: product)),
                  Provider<CartViewModel>(
                      builder: (context, child) => const SingleProductScreen(),
                      create: (_) => CartViewModel()),
                ]),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: product.image!,
                        placeholder: (_, __) => const CircularProgressIndicator(
                          strokeWidth: 3.0,
                          color: Colors.black,
                        ),
                        errorWidget: (context, url, error) =>
                            const Center(child: Text('Error occurred')),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${product.title}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '\$ ${product.price} ',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                    child: RatingStars(
                      value: (product.rating?.rate)!.toDouble(),
                      starBuilder: (index, color) => Icon(
                        Icons.star,
                        color: color,
                      ),
                      starCount: 5,
                      starSize: 25,
                      valueLabelColor: const Color(0xff9b9b9b),
                      valueLabelTextStyle:
                          const TextStyle(color: Colors.white, fontSize: 14.0),
                      maxValue: 5,
                      starOffColor: const Color(0xffe7e8ea),
                      starColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(color: Colors.black, strokeWidth: 5.0),
      );
    }
  }
}
