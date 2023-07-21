import '../../widgets.dart';

Widget buildProjectList(
    {required BuildContext context,
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required List<String> deviceRequired,
    required int payment,
    required DateTime createdAt,
    required ProjectListProvider projectListProvider,
    required ProjectProvider projectProvider,
    required int index,
    required Function()? onTap}) {
  double height = mediaQueryHeight(context);
  double width = mediaQueryWidth(context);
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: height * 0.012),
        height: projectProvider.showFullDescriptionList[index]
            ? height
            : height * 0.44,
        child: InkWell(
          onTap: onTap,
          child: Card(
            elevation: 3,
            color: AppColor.cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height * 0.012),
            ),
            child: Container(
              margin: EdgeInsets.all(height * 0.008),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                      context: context,
                      text: title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.025),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    customText(
                        context: context,
                        text: 'Posted ${createdAt.hour.toString()} hours ago ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.normal,
                        fontSize: height * 0.025),
                  ]),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              context: context,
                              text: 'Hourly',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.normal,
                              fontSize: height * 0.025),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          customText(
                              context: context,
                              text: 'Start Date',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.normal,
                              fontSize: height * 0.025),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          customText(
                              context: context,
                              text: 'End Date',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.normal,
                              fontSize: height * 0.025),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              context: context,
                              text: 'Rs.$payment',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.025),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          customText(
                              context: context,
                              text:
                                  '${startDate.day.toString()}/${startDate.month.toString()}/${startDate.year.toString()}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.025),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          customText(
                              context: context,
                              text:
                                  '${endDate.day.toString()}/${endDate.month.toString()}/${endDate.year.toString()}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.025),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: projectProvider.showFullDescriptionList[index],
                        child: customText(
                          context: context,
                          text: description,
                          maxLines: 20,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.normal,
                          fontSize: height * 0.025,
                        ),
                      ),
                      Visibility(
                        visible:
                            !projectProvider.showFullDescriptionList[index],
                        child: customText(
                          context: context,
                          text: description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.normal,
                          fontSize: height * 0.025,
                        ),
                      ),
                      Visibility(
                        visible: description.length >
                            80, // Show the "more" button only when there's more to show
                        child: GestureDetector(
                          onTap: () {
                            projectProvider.toggleFullDescription(index);
                          },
                          child: customText(
                            context: context,
                            text: projectProvider.showFullDescriptionList[index]
                                ? 'less'
                                : 'more',
                            color: AppColor.buttonColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Padding(
                    padding: EdgeInsets.all(height * 0.005),
                    child: Row(
                      children: [
                        Wrap(
                          spacing:
                              10, // Adjust the spacing between device requirements
                          children: List<Widget>.generate(deviceRequired.length,
                              (index) {
                            return Container(
                              alignment: Alignment.center,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                color: customPrimarySwatch,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: customPrimarySwatch),
                              ),
                              child: customText(
                                context: context,
                                text: deviceRequired[index],
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: height * 0.02,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  // const Divider(
                  //   color: AppColor.titleTextColor,
                  //   thickness: 0.5,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
