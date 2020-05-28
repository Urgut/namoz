import 'package:namazapp/features/home/data/models/section.model.dart';

class SectionLocalData {
  Future<List<SectionModel>> getData() async{
    final List<SectionModel> data = [
      SectionModel(
        title: "Намаз",
        description: "",
        image: "",
        route: "namaz",
      ),
      SectionModel(
        title: "Дәрет алу",
        description: "",
        image: "",
        route: "taharat",
      ),
      SectionModel(
        title: "Намаз туралы",
        description: "",
        image: "",
        route: "about_namaz",
      ),
      SectionModel(
        title: "Сұрақ-жауап",
        description: "",
        image: "",
        route: "faq",
      ),
    ];
    return data;
  }
}
