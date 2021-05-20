import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oneonones/app/oneonone/controller/oneonone.controller.dart';
import 'package:oneonones/common/enumerations/frequency.enum.dart';
import 'package:oneonones/common/models/employee/employee.model.dart';
import 'package:oneonones/common/utils/frequency.util.dart';

class OneononeInsert extends StatelessWidget {
  final OneononeController _oneononeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        width: 500,
        child: Form(
          child: Column(
            children: [
              Autocomplete<EmployeeModel>(
                displayStringForOption: (EmployeeModel employee) => employee.name,
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return _oneononeController.employees.where((EmployeeModel employee) {
                    return employee.name.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (EmployeeModel employee) => _oneononeController.oneononeInsertSetPartner(employee),
              ),
              DropdownButton<FrequencyEnum>(
                value: _oneononeController.oneononeInsertFrequency,
                items: FrequencyEnum.values
                    .map((FrequencyEnum frequency) => DropdownMenuItem<FrequencyEnum>(
                          value: frequency,
                          child: Text(FrequencyUtil.toText(frequency)),
                        ))
                    .toList(),
                onChanged: (FrequencyEnum? frequency) => _oneononeController.oneononeInsertSetFrequency(frequency),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
