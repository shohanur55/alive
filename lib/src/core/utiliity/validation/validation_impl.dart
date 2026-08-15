import 'package:flutter/material.dart';

import 'validation.dart';

class Validator {
  Validator(this.context);

  final BuildContext context;

  FormFieldValidator<T> apply<T>(List<Validation<T>> validations) {
    return (T? value) {
      for (Validation validation in validations) {
        final error = validation.validate(context, value);
        if (error != null) return error;
      }

      return null;
    };
  }
}
