import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopapp/model/Product.dart';
import 'package:shopapp/Provider/Product_Provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = 'edit−product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final priceFocusNode = FocusNode();
  final descriptionNode = FocusNode();
  final imageUrlController = TextEditingController();
  final form = GlobalKey<FormState>();

  var editProduct =
      Product(id: null, title: '', description: '', price: 0, imageUrl: '');

  var initValues = {'title': '', 'description': '', 'price': '', 'imageUrl': ''};

  var isInit = true;


  @override
  void didChangeDependencies() {
    if (isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        editProduct = Provider.of<Products>(context).getProductById(productId);
        initValues = {
          'title': editProduct.title,
          'description': editProduct.description,
          'price': editProduct.price.toString(),
//          'imageUrl': editProduct.imageUrl
          'imageUrl':''
        };
        imageUrlController.text = editProduct.imageUrl;
      }
    }
    isInit = false;
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    priceFocusNode.dispose();
    descriptionNode.dispose();
    imageUrlController.dispose();
    super.dispose();
  } // dispose will clear from the memory.

  void savForm() {
    final isValid = form.currentState.validate();
    if (!isValid) {
      return;
    }
    form.currentState.save();
    if(editProduct.id != null){
      Provider.of<Products>(context, listen: false).updateProduct(editProduct.id, editProduct);
    }
    else{
      Provider.of<Products>(context, listen: false).addProduct(editProduct);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: savForm,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  initialValue: initValues['title'],
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(priceFocusNode);
                  },
                  onSaved: (value) {
                    editProduct = Product(
                        title: value,
                        description: editProduct.description,
                        price: editProduct.price,
                        imageUrl: editProduct.imageUrl,
                        id: editProduct.id,
                      isFavorite: editProduct.isFavorite
                    );
                  },
                ),
                TextFormField(
                  initialValue: initValues['price'],
                  decoration: InputDecoration(labelText: 'Price'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter valid number';
                    }
                    if (double.tryParse(value) <= 0) {
                      return 'Please enter number greater than zero';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(descriptionNode);
                  },
                  onSaved: (value) {
                    editProduct = Product(
                        title: editProduct.title,
                        description: editProduct.description,
                        price: double.parse(value),
                        imageUrl: editProduct.imageUrl,
                        id: editProduct.id,
                        isFavorite: editProduct.isFavorite);
                  },
                ),
                TextFormField(
                  initialValue:initValues['description'],
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a description';
                    }
                    if (value.length <= 10) {
                      return 'Please enter number of character greater than 10';
                    }
                    return null;
                  },
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  focusNode: descriptionNode,
                  onSaved: (value) {
                    editProduct = Product(
                        title: editProduct.title,
                        description: value,
                        price: editProduct.price,
                        imageUrl: editProduct.imageUrl,
                        id: editProduct.id,
                        isFavorite: editProduct.isFavorite);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: imageUrlController.text.isEmpty
                          ? Text('Enter a URL')
                          : FittedBox(
                              child: Image.network(
                                imageUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image URL'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a image URL';
                          }
                          if (!value.startsWith('http') ||
                              !value.startsWith('https')) {
                            return 'Please enter valid URL';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: imageUrlController,
                        onFieldSubmitted: (_) {
                          savForm();
                        },
                        onSaved: (value) {
                          editProduct = Product(
                              title: editProduct.title,
                              description: editProduct.description,
                              price: editProduct.price,
                              imageUrl: value,
                              id: editProduct.id,
                              isFavorite: editProduct.isFavorite);
                        },
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
