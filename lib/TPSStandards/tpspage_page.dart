// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../app/controllers/theme_controller.dart';
// import '../app/pages/widgets/loading_widget.dart';
// import '../app/pages/sidemenu/sidemenu_page.dart';

// import 'tpspage_controller.dart';

// class TPSPage extends GetView<TPSPageController> {
//   @override
//   Widget build(BuildContext context) {

//     //Get passed parameter
//     //var somevar = Get.arguments; //TODO: Pass the value from previous screen
//     //Get other depended controllers
//     var themeCtrl = Get.find<ThemeController>();

//     return Scaffold(
//       // drawer: appDrawer(), //TODO: Remove if drawer is not required
//       appBar: AppBar(
//         actions: [
//           //TODO: Remove if right action is not required conditionally
//           Obx(() {
//             return IconButton(
//               icon: Icon(
//                 controller.searchMode ? Icons.search : Icons.search,
//                 color: controller.searchMode
//                     ? Colors.white
//                     : themeCtrl.activeTheme.iconTheme.color,
//               ),
//               onPressed: () {
//                 controller.searchMode = !controller.searchMode;
//               },
//             );
//           })
//         ],
//       ),
//       body: SafeArea(
//         child: GetX<TPSPageController>(
//           initState: (state) {},
//           builder: (controller) {
//             return controller.isLoading
//                 ? LoadingWidget()
//                 : Column(children: []);
//           },
//         ),
//       ),
//     );
//   }

//   //TODO: Remove if drawer is not required
//   // Widget appDrawer() {
//   //   return SideMenuPage();
//   // }
// }
