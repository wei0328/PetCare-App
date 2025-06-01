import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String price;
  final int quantity;
  final String image;
  final String id;
  final String collection;

  Product(
      {required this.name,
      required this.price,
      required this.image,
      required this.quantity,
      required this.id,
      required this.collection});
}

List<Product> cart = [];

Future<void> updateSoldQuantity() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  await Future.forEach(cart, (Product product) async {
    final String id = product.id;
    final String collection = product.collection;
    final int soldQuantity = product.quantity;

    // Reference to the document in the soldQuantity collection
    final DocumentReference docRef =
        _firestore.collection('soldQuantity').doc(product.name);

    // Fetch the document snapshot to check if the item already exists
    final DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      // If the item already exists, update its quantity
      final int currentQuantity = docSnapshot['quantity'] as int;
      await docRef.update({
        'collection': collection,
        'product': product.name,
        'soldQuantity': currentQuantity + soldQuantity,
      });
    } else {
      // If the item does not exist, add it to the soldQuantity collection
      await docRef.set({
        'collection': collection,
        'quantity': soldQuantity,
        'product': product.name,
      });
    }
  });
}

void addToCart(String name, String price, String image, int quantity, String id,
    String collection) {
  bool productExists = false;

  for (int i = 0; i < cart.length; i++) {
    if (cart[i].name == name) {
      cart[i] = Product(
          name: cart[i].name,
          price: cart[i].price,
          image: cart[i].image,
          quantity: cart[i].quantity + quantity,
          id: cart[i].id,
          collection: cart[i].collection);
      productExists = true;
      break;
    }
  }

  if (!productExists) {
    cart.add(Product(
        name: name,
        price: price,
        image: image,
        quantity: quantity,
        id: id,
        collection: collection));
  }
}

void addOne(String name) {
  for (int i = 0; i < cart.length; i++) {
    if (cart[i].name == name) {
      cart[i] = Product(
          name: cart[i].name,
          price: cart[i].price,
          image: cart[i].image,
          quantity: cart[i].quantity + 1,
          id: cart[i].id,
          collection: cart[i].collection);
    }
  }
}

void minusOne(String name) {
  for (int i = 0; i < cart.length; i++) {
    if (cart[i].name == name) {
      if (cart[i].quantity == 1) {
        cart.removeAt(i);
      } else {
        cart[i] = Product(
            name: cart[i].name,
            price: cart[i].price,
            image: cart[i].image,
            quantity: cart[i].quantity - 1,
            id: cart[i].id,
            collection: cart[i].collection);
      }
    }
  }
}
