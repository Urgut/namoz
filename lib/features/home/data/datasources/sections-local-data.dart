import 'package:namazapp/core/constants/routes.dart';
import 'package:namazapp/features/home/data/models/section.model.dart';

class SectionLocalData {
  Future<List<SectionModel>> getData() async {
    final List<SectionModel> data = [
      SectionModel(
        title: "Намаз",
        description: "",
        image: 'assets/images/ava-namaz-2.png',
        route: Routes.genderPage,
      ),
      SectionModel(
        title: "Дәрет алу",
        description: "",
        image: 'assets/images/taharat.png',
        route: Routes.taharatPage,
      ),
      SectionModel(
        title: "Намаз туралы",
        description: "",
        image: 'assets/images/about.png',
        route: Routes.namazAboutPage,
      ),
      SectionModel(
        title: "Сұрақ-жауап",
        description: "",
        image: 'assets/images/faq.png',
        route: Routes.faqPage,
      ),
    ];
    return data;
  }
}
