import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';
import '../bloc/app_state.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            print(state.products);
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 120,
                      height: 150,
                      child: Image(
                        image: NetworkImage(product.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 240.0,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8, bottom: 8),
                            child: Text(
                              product.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(product.price.toString()),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }
          if (state is ErrorState) {
            return const Center(
              child: Text("Error on Loading Products"),
            );
          }
          return Container();
        }));
  }
}
