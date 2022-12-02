import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap ;
  final bool loading ;
  const AuthButton({Key? key,
    required this.title,
    required this.onTap,
    required this.loading 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: loading ?const CircularProgressIndicator(strokeWidth: 3, color: Colors.white,) :
          Text(title, style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500),),),
      ),
    );
  }

}
