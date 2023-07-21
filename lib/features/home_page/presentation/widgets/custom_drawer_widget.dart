// import '../../../../core/utils/constants/exports.dart';

// class CustomDrawerWidget extends StatelessWidget {
//   const CustomDrawerWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double height = mediaQueryHeight(context);
//     double width = mediaQueryWidth(context);
//     return Drawer(
//       backgroundColor: AppColor.drawerColor,
//       width: width * 0.7,
//       child: Consumer<DrawerPageProvider>(
//         builder: (context, provider, child) => ListView(
//           children: [
//             SizedBox(
//               height: height * 0.03,
//             ),
//             Center(
//               child: SizedBox(
//                 height: height * 0.25,
//                 child: DrawerHeader(
//                   padding: EdgeInsets.zero,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: height * 0.04,
//                         backgroundColor: Colors.white,
//                         backgroundImage: const AssetImage(ImagePath.googleLogo),
//                       ),
//                       SizedBox(
//                         height: height * 0.03,
//                       ),
//                       Column(
//                         children: [
//                           customText(
//                             context: context,
//                             text: 'Pradeep Tharu',
//                             color: AppColor.backgroundColor,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           customText(
//                             context: context,
//                             text: 'pradeep@vurilo.com',
//                             color: AppColor.backgroundColor,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           SizedBox(
//                             height: height * 0.03,
//                           ),
//                           const Divider(
//                             color: AppColor.titleTextColor,
//                             thickness: 0.5,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.dashboard, color: Colors.white),
//               title: customText(
//                 context: context,
//                 text: 'Dashboard',
//                 color: provider.isSelected1
//                     ? Colors.black
//                     : AppColor.backgroundColor,
//               ),
//               selected: provider.getSelectedIndex == 0,
//               selectedTileColor: Colors.green,
//               onTap: () {
//                 provider.setSelectedIndex(0);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings, color: Colors.white),
//               title: customText(
//                 context: context,
//                 text: 'Project',
//                 color: provider.isSelected2
//                     ? Colors.black
//                     : AppColor.backgroundColor,
//               ),
//               selected: provider.getSelectedIndex == 1,
//               selectedTileColor: Colors.green,
//               onTap: () {
//                 provider.setSelectedIndex(1);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.payment, color: Colors.white),
//               title: customText(
//                 context: context,
//                 text: 'Payment',
//                 color: provider.isSelected3
//                     ? Colors.black
//                     : AppColor.backgroundColor,
//               ),
//               selected: provider.getSelectedIndex == 2,
//               selectedTileColor: Colors.green,
//               onTap: () {
//                 provider.setSelectedIndex(2);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings, color: Colors.white),
//               title: customText(
//                 context: context,
//                 text: 'Settings',
//                 color: provider.isSelected4
//                     ? Colors.black
//                     : AppColor.backgroundColor,
//               ),
//               selected: provider.getSelectedIndex == 3,
//               selectedTileColor: Colors.green,
//               onTap: () {
//                 provider.setSelectedIndex(3);
//                 Navigator.pop(context);
//               },
//             ),
//             SizedBox(
//               height: height * 0.3,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {},
//                   icon: const Icon(Icons.logout),
//                   label: customText(
//                     context: context,
//                     text: 'Logout',
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
