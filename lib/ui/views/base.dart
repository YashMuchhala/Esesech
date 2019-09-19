import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/base.dart';
import '../../locator.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onViewModelInit;
  BaseView({this.builder, this.onViewModelInit});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {

  T model = locator<T>();

  @override
  void initState() {

    if(widget.onViewModelInit != null) {

      widget.onViewModelInit(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (BuildContext context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}