import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/features/payment/presentation/pages/payment_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double width = mediaQueryWidth(context);
    double height = mediaQueryHeight(context);

    return Drawer(
      backgroundColor: AppColor.drawerColor,
      width: width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Center(
            child: SizedBox(
              height: height * 0.25,
              child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: height * 0.04,
                        backgroundColor: Colors.white,
                        backgroundImage: const AssetImage(ImagePath.googleLogo),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Column(
                        children: [
                          customText(
                            context: context,
                            text: 'Pradeep Tharu',
                            color: AppColor.backgroundColor,
                            fontWeight: FontWeight.w500,
                          ),
                          customText(
                            context: context,
                            text: 'pradeep@vurilo.com',
                            color: AppColor.backgroundColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          const Divider(
            color: AppColor.titleTextColor,
            thickness: 0.5,
          ),
          buildListTile(
            iconData: const Icon(
              Icons.dashboard,
              color: AppColor.backgroundColor,
            ),
            title: customText(
              context: context,
              text: 'DashBoard',
              color: AppColor.backgroundColor,
            ),
            onTap: () {},
          ),
          buildListTile(
              iconData: const Icon(
                Icons.folder,
                color: AppColor.backgroundColor,
              ),
              title: customText(
                context: context,
                text: 'Project',
                color: AppColor.backgroundColor,
              ),
              onTap: () {}),
          buildListTile(
              iconData: const Icon(
                Icons.money,
                color: AppColor.backgroundColor,
              ),
              title: customText(
                context: context,
                text: 'Payment',
                color: AppColor.backgroundColor,
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PaymentPage(),
                  ))),
          buildListTile(
            iconData: const Icon(
              Icons.settings,
              color: AppColor.backgroundColor,
            ),
            title: customText(
              context: context,
              text: 'Setting',
              color: AppColor.backgroundColor,
            ),
            onTap: () {},
          ),
          SizedBox(
            height: height * 0.3,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: customText(
                context: context, text: 'Logout', color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(
      {Widget? iconData, Widget? title, void Function()? onTap}) {
    return ListTile(
      leading: iconData,
      title: title,
      onTap: onTap,
    );
  }
}
// hello