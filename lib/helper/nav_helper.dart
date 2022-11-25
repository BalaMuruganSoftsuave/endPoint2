import 'dart:collection';
import 'package:endpoint2/screens/search_contract_screen.dart';
import 'package:flutter/material.dart';
import '../screens/add_charter_screen.dart';
import 'nav_observer.dart';

const String initialRoute = "/initialRoute";
const String addCharterScreen = "/addCharterScreen";

Route<Object?>? generateRoute(RouteSettings settings) {
  return getRoute(settings.name);
}

Route<Object?>? getRoute(String? name, {LinkedHashMap? args}) {
  switch (name) {
    case initialRoute:
      return MaterialPageRoute(
          builder: (context) => const SearchContractScreen(),
          settings: RouteSettings(name: name));
    case addCharterScreen:
      return MaterialPageRoute(
          builder: (context) =>  AddCharterScreen(),
          settings: RouteSettings(name: name));
  }
  return null;
}

openScreen(String routeName,
    {bool forceNew = false,
    bool requiresAsInitial = false,
    LinkedHashMap? args}) {
  var route = getRoute(routeName, args: args);
  var context = NavObserver.navKey.currentContext;
  if (route != null && context != null) {
    if (requiresAsInitial) {
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else if (forceNew || !NavObserver.instance.containsRoute(route)) {
      Navigator.push(context, route);
    } else {
      Navigator.popUntil(context, (route) {
        if (route.settings.name == routeName) {
          if (args != null) {
            (route.settings.arguments as Map)["result"] = args;
          }
          return true;
        }
        return false;
      });
    }
  }
}

back(LinkedHashMap? args) {
  if (NavObserver.navKey.currentContext != null) {
    Navigator.pop(NavObserver.navKey.currentContext!, args);
  }
}
