import 'package:flutter/material.dart';

class OneononeInsert extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        width: 500,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return [
                    'aardvark',
                    'bobcat',
                    'chameleon',
                  ].where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  print('You just selected $selection');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
