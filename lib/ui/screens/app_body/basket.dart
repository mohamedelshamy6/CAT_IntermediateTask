import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/cart_view_model.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartModel = context.read<CartViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2D46B9),
        title: const Text(
          'Basket',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Image.network(
                        (cartModel.basketItem[index].image).toString()),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Text(cartModel.basketItem[index].name),
                        const SizedBox(height: 10),
                        Text('\$ ${cartModel.basketItem[index].price}'),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              color: const Color(0xff2D46B9).withOpacity(0.6),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: const Color(0xff2D46B9).withOpacity(0.6),
                              child: const Text('1'),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              color: const Color(0xff2D46B9).withOpacity(0.6),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
              itemCount: cartModel.basketItem.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      'Total :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '0',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: MaterialButton(
                    height: 50,
                    color: const Color(0xff2D46B9),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      'Check out',
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
        ],
      ),
    );
  }
}
