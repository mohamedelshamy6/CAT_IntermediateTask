import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:untitled/view_model/cart_view_model.dart';
import '../../../view_model/single_product_view_model.dart';
import 'items.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleProductViewModel>();
    final cardModel = context.read<CartViewModel>();
    final singleProduct = viewModel.singleProduct;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff2D46B9),
        title: Text(
          singleProduct.title!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: ChangeNotifierProvider<CartViewModel>(
        create: (context) => CartViewModel(),
        builder: (context, child) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CachedNetworkImage(
                    imageUrl: singleProduct.image!,
                    placeholder: (_, __) => const CircularProgressIndicator(
                      strokeWidth: 3.0,
                      color: Colors.black,
                    ),
                    errorWidget: (context, url, error) =>
                        const Center(child: Text('Error occurred')),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text(
                  '${singleProduct.title}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  '\$ ${singleProduct.price} ',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    FittedBox(
                      child: RatingStars(
                        value: (singleProduct.rating?.rate)!.toDouble(),
                        starBuilder: (index, color) => Icon(
                          Icons.star,
                          color: color,
                        ),
                        starCount: 5,
                        starSize: 25,
                        valueLabelColor: const Color(0xff9b9b9b),
                        valueLabelTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                        maxValue: 5,
                        starOffColor: const Color(0xffe7e8ea),
                        starColor: Colors.yellow,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${singleProduct.rating?.count}  reviews',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 5.0),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  singleProduct.description!,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: MaterialButton(
                    height: 60,
                    color: const Color(0xff2D46B9),
                    onPressed: () {
                      cardModel.add(
                        Items(singleProduct.image!, singleProduct.title!,
                            (singleProduct.price!).toDouble()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
