import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);
  final bool isLoading;

  final void Function(
    String email,
    String username,
    String password,
    File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trysubmit() {
    final _isvalid = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Please pick an Image'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }

    if (_isvalid) {
      _formkey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userName.trim(),
        _userPassword.trim(),
        _userImageFile,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_isLogin) UserImagePicker(_pickedImage),
                  TextFormField(
                    key: ValueKey('email'),
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Enter valid Email Address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email Address'),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      autocorrect: true,
                      textCapitalization: TextCapitalization.words,
                      enableSuggestions: false,
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Username must be at least 4 charecters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 charecters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    RaisedButton(
                      child: Text(_isLogin ? 'Login' : 'Signup'),
                      onPressed: _trysubmit,
                    ),
                  if (!widget.isLoading)
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'),
                      textColor: Theme.of(context).primaryColor,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
