import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/app.module.dart';
import 'package:oneonones/app/app.widget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: App()));
