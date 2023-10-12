import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/setting_page_controller.dart';

class SettingsPage extends GetView<SettingPageController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _backBtn(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _categoryTitle(title: "theme".tr, icon: "theme.png"),
          GetBuilder<SettingPageController>(
            builder: (controller) => _listBuilder(
                count: controller.themes.length,
                (context, i) => RadioListTile.adaptive(
                      value: controller.themes[i],
                      groupValue: controller.selctedTheme,
                      title: Text("${controller.themes[i]}".tr),
                      onChanged: (newVal) =>
                          controller.setSelectedTheme(newVal),
                    )),
          ),
          _divider(),
          _categoryTitle(title: "language".tr, icon: "language.png"),
          GetBuilder<SettingPageController>(
            builder: (controller) => _listBuilder(
              count: controller.languages.length,
              (context, i) => RadioListTile.adaptive(
                value: controller.languages[i],
                groupValue: controller.selectedLang,
                title: Text("${controller.languages[i]}".tr),
                onChanged: (newVal) => controller.setSelectedLang(newVal),
              ),
            ),
          ),
          _divider(),
          _categoryTitle(title: "other".tr, icon: "other.png"),
          GetBuilder<SettingPageController>(
            builder: (controller) => _listBuilder(
              count: controller.others.length,
              (context, i) => ListTile(
                  title: Text("${controller.others[i]["title"]}".tr),
                  leading: controller.others[i]["icon"],
                  onTap: controller.others[i]["onTap"]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}

Card _backBtn() {
  return Card(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 8),
      child: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
        ),
      ));
}

Padding _categoryTitle({required String title, required String icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Row(
      children: [
        Image.asset(
          "assets/icons/$icon",
          height: 28,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(title),
      ],
    ),
  );
}

Divider _divider() {
  return const Divider(
    height: 15,
    thickness: 0.5,
    // color: Colors.black,
  );
}

ListView _listBuilder(Widget Function(BuildContext, int) widgetBuilder,
    {required int count}) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: count,
    itemBuilder: widgetBuilder,
  );
}
