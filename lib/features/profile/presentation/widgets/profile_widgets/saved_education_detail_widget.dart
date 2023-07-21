import 'package:qa_lint/features/addtional_information/presentation/widgets.dart';
import 'package:qa_lint/features/profile/presentation/provider/education_provider.dart';
import 'package:qa_lint/features/profile/presentation/widgets/profile_widgets/education_editing_card_widget.dart';
import 'package:qa_lint/features/profile/presentation/widgets/profile_widgets/education_view_card_detail_widget.dart';

class SavedEducationDetailCardWidget extends StatelessWidget {
  const SavedEducationDetailCardWidget({
    Key? key,
    required this.educationDetailProvider,
  }) : super(key: key);

  final EducationDetailProvider educationDetailProvider;

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);

    if (educationDetailProvider.selectedEducationDetail != null) {
      return CardEditingMode(
        height: height,
        educationDetailProvider: educationDetailProvider,
      );
    } else {
      return CardViewModeWidget(
        height: height,
        educationDetailProvider: educationDetailProvider,
      );
    }
  }
}
