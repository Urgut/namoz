import 'package:flutter/foundation.dart';

abstract class GenderEvents {
  String gender;
}

class UpdateGenderEvent extends GenderEvents {
  final String gender;

  UpdateGenderEvent({
    @required this.gender,
  }) : assert(gender != null);
}
