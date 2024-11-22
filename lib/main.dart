import 'package:flutter/material.dart';
import 'package:yuga_portfolio/views/home_page.dart';

void main()
{
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dashboard',
      routes:
      {
        '/dashboard' : (context) => HomePage(),

      },
   )
  );
}