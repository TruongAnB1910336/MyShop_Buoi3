import 'package:MyShop/ui/products/products_manager.dart';
import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'package:provider/provider.dart';
class UserProductListTile extends StatelessWidget{
  final Product product;
  const UserProductListTile(
    this.product, {
      super.key,
    }
  );
  @override
  Widget build(BuildContext context){
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButtton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }
  Widget buildDeleteButton(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
       context.read<ProductsManager>().deleteProduct(product.id!);
       ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(
              'Product delete',
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
      color: Theme.of(context).errorColor,
    );
  }
  Widget buildEditButtton(BuildContext context){
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: (){
        print('Go to edit product screen');
      },
      color: Theme.of(context).primaryColor,
    );
  }
}