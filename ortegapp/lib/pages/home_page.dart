import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/blocs/authentication/authentication.dart';
import 'package:flutter_bloc_authentication/config/locator.dart';
import 'package:flutter_bloc_authentication/pages/producto_page.dart';
import 'package:flutter_bloc_authentication/repositories/producto_repository.dart';
import 'package:flutter_bloc_authentication/services/services.dart';
import '../models/models.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key, required User user});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }


}

class MyStatefulWidget extends StatefulWidget {

  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
        int _selectedIndex = 0;

    List<Widget> _widgetOptions = <Widget>[
        ProductoPage(),
      
    ];

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   _MyStatefulWidgetState();

  
    @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),

        body: _widgetOptions.elementAt(_selectedIndex),
        

      
            bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Like',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    
    );
  }
}
