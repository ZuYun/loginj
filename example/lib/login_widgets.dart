import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginj/loginj.dart';

import 'login.dart';

const double padding = 24;

const double height = 270;

const double cardPadding = 16;

final ValueNotifier<bool> valueNotifier = ValueNotifier(false);

String _userName = "";

String _password = "";

bool _showLoading = false;

Widget firstFrontCard(BuildContext context, double aniValue) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 20 * (1 - aniValue),
    child: SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(cardPadding),
        child: Opacity(
          opacity: 1 - aniValue * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: const Offset(75, height / 2) * aniValue,
                child: Text(
                  "SIGN IN",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                maxLines: 1,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(),
                  hintText: 'Enter User Name',
                ),
                onChanged: (input) {
                  _userName = input;
                  // _checkInput();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              EditPassword(
                labelText: "password",
                hintText: 'Enter Password',
                onChanged: (input) {
                  _password = input;
                  // _checkInput();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return TextButton(
                      onPressed: () {},
                      child: AnimatedContainer(
                        curve: value ? Curves.easeOutBack : Curves.easeInQuart,
                        duration: const Duration(seconds: 1),
                        child: Text("CONTINUE",
                            style: TextStyle(
                                fontSize: 20,
                                color: value
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).disabledColor)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget firstBackCard(BuildContext context, double aniValue) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 20 * (1 - aniValue),
    child: InkWell(
      onTap: () {
        FlipOverj.of(context)?.toggle();
      },
      child: SizedBox(
        height: height,
        width: double.maxFinite,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Transform.translate(
                  offset: const Offset(-75, -height / 2) * (1 - aniValue),
                  child: Opacity(
                    opacity: 2 * (aniValue - .5),
                    child: Text(
                      "SIGN IN",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget secondFrontCard(BuildContext context, double aniValue) {
  return Stone(
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 20 * aniValue,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(cardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SIGN UP",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                maxLines: 1,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(),
                  labelText: "user name",
                  hintText: 'Enter User Name',
                ),
                onChanged: (input) {
                  _userName = input;
                  // _checkInput();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              EditPassword(
                labelText: "password",
                hintText: 'Enter Password',
                onChanged: (input) {
                  _userName = input;
                  // _checkInput();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return TextButton(
                      onPressed: () {
                        if (value) {
                          // setState(() {
                          //   _showLoading = true;
                          // });
                        }
                      },
                      child: AnimatedContainer(
                        curve: value ? Curves.easeOutBack : Curves.easeInQuart,
                        duration: const Duration(seconds: 1),
                        child: Text("CONTINUE",
                            style: TextStyle(
                                fontSize: 20,
                                color: value
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).disabledColor)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget secondBackCard(BuildContext context, double aniValue) {
  return Stone(
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          toggle(context);
        },
        child: SizedBox(
          width: double.maxFinite,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Text(
              "SIGN UP",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ),
    ),
  );
}

class EditPassword extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  const EditPassword({Key? key, this.labelText, this.hintText, this.onChanged}) : super(key: key);

  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  bool _isObscure = true;
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: focusNode,
        maxLines: 1,
        onChanged: widget.onChanged,
        obscureText: _isObscure,
        textInputAction: TextInputAction.send,
        onTap: (){
          focusNode.requestFocus();
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ));
  }
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController _animationControl;

  @override
  void initState() {
    super.initState();
    _animationControl =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 345));
    _animationControl.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: Tween(begin: .6, end: 1.2)
            .chain(CurveTween(curve: Curves.easeOutQuad))
            .animate(_animationControl),
        child: const Card(
          elevation: 30,
          shape: CircleBorder(),
          child: SizedBox(
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
