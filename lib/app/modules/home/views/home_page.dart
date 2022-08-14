import 'package:flutter/material.dart';

import '../../../core/utils/size_config.dart';
import '../widgets/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
