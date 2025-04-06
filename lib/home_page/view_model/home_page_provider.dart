import 'package:flutter/cupertino.dart';

import '../../services/network_services/repository/authentication_repository/auth_repo.dart';
import '../model/home_page_model.dart';

class HomePageProvider extends ChangeNotifier {
  List<HomePageModel>? homePageModel = [];
  int? selected_main_category_id;
  int? selected_main_sub_category_id;
  get_category_info() async {
    List responce = await Repository.instance.category_info();
    responce.forEach((v) {
      homePageModel!.add(HomePageModel.fromJson(v));
    });
    select_main_category();
    select_sub_category();
  }

  select_main_category({int selected_index = 0}) {
    selected_main_category_id = homePageModel![selected_index].id;
    select_sub_category();
    notifyListeners();
  }

  select_sub_category({int selected_index = 0}) {
    int index =
        homePageModel!.indexWhere((v) => v.id == selected_main_category_id);
    selected_main_sub_category_id =
        homePageModel![index].subCategory![selected_index].id;
    notifyListeners();
  }

  update_state() {
    notifyListeners();
  }
}
