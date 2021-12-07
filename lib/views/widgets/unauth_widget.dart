import 'package:cartanawc_app/core/widgets/appbar_content/appbar_cartana_logo.dart';
import 'package:cartanawc_app/views/login_page.dart';
import 'package:flutter/material.dart';

class UnAuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarCartanaLogo(),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
          child: Column(
            children: [
              const Icon(
                Icons.lock,
                size: 90,
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                  'Vous devez être connecter pour acceder à cette section'),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.black),
                  child: const Text(
                    'Se connecter',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
    return Consumer<CartProvider>(builder: (context, orderModel, child) {
    if (orderModel.isOrderCreated) {
    return Center(
    child: Container(
    margin: const EdgeInsets.only(top: 100.0),
    child: Column(
    children: [
    const Icon(
    Icons.lock,
    size: 90,
    ),
    const SizedBox(
    height: 15.0,
    ),
    const Text(
    'Vous devez être connecter pour acceder a cette section'),
    TextButton(
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => LoginPage()));
    },
    child: const Text('Se connecter'),
    ),
    ],
    ),
    ),
    );
    }
    return const Center(
    child: CircularProgressIndicator(),
    );
    });
    **/
