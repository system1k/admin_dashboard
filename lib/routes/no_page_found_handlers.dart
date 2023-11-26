import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class NoPageFoundHandlers {

  static Handler noPageFound = Handler(
    handlerFunc: (context, params) {

      Provider.of<SideMenuProvider>(context!, listen: false).setCurrentPageUrl('/404');

      return const NoPageFoundView();
    }
  );

}