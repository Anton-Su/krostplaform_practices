import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final bool isProtected;
  final String type;
  final TextEditingController? controller;
  const CustomTextFormField({super.key, required this.isProtected, required this.type, this.controller,});

  @override
  State<StatefulWidget> createState() {
    return _CustomTextFormFieldState();
  }

}


class _CustomTextFormFieldState extends State<CustomTextFormField>{
  bool _eyeText = true;
  final List<IconData> EarlyIcon = [
    Icons.person,
    Icons.shield,
    Icons.email,
    Icons.shield_moon
  ];


  void _typeEye() {
    setState(() {
      _eyeText = !_eyeText;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 22),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: _eyeText && widget.isProtected,
      decoration: InputDecoration(
          hintText: switch (widget.type) {
            "Name" => "Введите имя",
            "Email" => "Введите email",
            "Password" => "Введите пароль",
            "ConfirmPassword" => "Повторите пароль",
            String() => "Введите чёрт знает что",
          },
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          prefixIcon: switch (widget.type) {
            "Name" => Icon(EarlyIcon[0]),
            "Email" => Icon(EarlyIcon[2]),
            "Password" => Icon(EarlyIcon[1]),
            "ConfirmPassword" => Icon(EarlyIcon[3]),
            String() => Icon(Icons.question_answer),
          },
          suffixIcon: (widget.isProtected) ? IconButton(
              icon: (_eyeText) ? Icon(Icons.visibility_off) : Icon(
                  Icons.visibility),
              onPressed: () {
                _typeEye();
              }
          ) : null
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Поле не может быть пустым";
        }
        if (widget.isProtected) {
          final hasLetter = RegExp(r'[a-zA-Zа-яА-Я]').hasMatch(value);
          final hasDigit = RegExp(r'\d').hasMatch(value);
          final hasSymbol = RegExp(r'[!@#$%^&*(),.?":{}|<>+_\-]').hasMatch(
              value);
          final bool regPassword = hasLetter && hasSymbol && hasDigit &&
              value.length >= 6;
          if (!regPassword) {
            return "Пароль должен содержать букву, цифру, спец. символ и быть не менее 6 символов";
          }
        }
        else if (widget.type == "Email") {
          final bool regEmail = RegExp(r'^[\w.-]+@[\w.-]+\.\w+$').hasMatch(
              value);
          if (!regEmail) {
            return "Некорректный формат Email";
          }
        }
        else if (widget.type == "Name") {
          final regName = RegExp(r'^[a-zA-Zа-яА-ЯёЁ\s]+$').hasMatch(value);
          if (!regName) {
            return "Полное имя может содержать только буквы и пробелы";
          }
        }
        return null;
      },
      keyboardType: widget.isProtected
          ? TextInputType.visiblePassword
          : TextInputType.text,
    );
  }
}