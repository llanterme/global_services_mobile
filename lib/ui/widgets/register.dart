import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final TextEditingController mobileNumbercontroller;
  final TextEditingController nameController;
  final TextEditingController emailAddressController;

  Register({
    required this.mobileNumbercontroller,
    required this.emailAddressController,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      EmailAddressField(emailAddressController),
      MobileField(mobileNumbercontroller),
      NameField(nameController)
    ]);
  }
}

class EmailAddressField extends StatelessWidget {
  final TextEditingController Emailcontroller;

  EmailAddressField(this.Emailcontroller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      alignment: Alignment.centerLeft,
      child: TextFormField(
          validator: validateEmail,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'email',
              prefixIcon: Icon(Icons.email)),
          controller: Emailcontroller),
    );
  }

  String? validateEmail(String? value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value!)) {
      return "Invalid email address";
    } else {
      return null;
    }
  }
}

class MobileField extends StatelessWidget {
  final TextEditingController emailAddressController;

  MobileField(this.emailAddressController);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      //  height: 50.0,
      alignment: Alignment.centerLeft,
      child: TextFormField(
          validator: validateMobile,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          obscureText: false,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'mobile',
              prefixIcon: Icon(Icons.phone)),
          controller: emailAddressController),
    );
  }

  String? validateMobile(String? value) {
    if (value!.length < 8) {
      return 'Number must be more than 8 charaters';
    } else {
      return null;
    }
  }
}

class NameField extends StatelessWidget {
  final TextEditingController nameController;

  NameField(this.nameController);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      alignment: Alignment.centerLeft,
      child: TextFormField(
          validator: validateName,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          obscureText: false,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'name',
              prefixIcon: Icon(Icons.person)),
          controller: nameController),
    );
  }

  String? validateName(String? value) {
    if (value!.length < 2) {
      return 'Name must be more than 2 charaters';
    } else {
      return null;
    }
  }
}
