import 'package:qa_lint/features/settings/widgets.dart';

class NoInternetAnimation extends StatefulWidget {
  final bool showAnimation;

  const NoInternetAnimation({super.key, required this.showAnimation});

  @override
  // ignore: library_private_types_in_public_api
  _NoInternetAnimationState createState() => _NoInternetAnimationState();
}

class _NoInternetAnimationState extends State<NoInternetAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);
    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    return SingleChildScrollView(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_animation.value * 200, 0.0),
            child: Opacity(
              opacity: 1 - _animationController.value,
              child: SizedBox(
                width: widget.showAnimation ? double.infinity : 0,
                child: Column(
                  children: [
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: height * 0.012),
                        padding:
                            EdgeInsets.symmetric(horizontal: height * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(26, 138, 134, 134)),
                          borderRadius: BorderRadius.circular(height * 0.012),
                        ),
                        alignment: Alignment.center,
                        height: height * 0.1,
                        width: double.infinity),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: height * 0.012),
                        padding:
                            EdgeInsets.symmetric(horizontal: height * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(26, 138, 134, 134),
                          ),
                          borderRadius: BorderRadius.circular(height * 0.012),
                        ),
                        alignment: Alignment.center,
                        height: height * 0.1,
                        width: double.infinity),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: height * 0.012),
                        padding:
                            EdgeInsets.symmetric(horizontal: height * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(26, 138, 134, 134),
                          ),
                          borderRadius: BorderRadius.circular(height * 0.012),
                        ),
                        alignment: Alignment.center,
                        height: height * 0.1,
                        width: double.infinity),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: height * 0.012),
                        padding:
                            EdgeInsets.symmetric(horizontal: height * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(26, 138, 134, 134),
                          ),
                          borderRadius: BorderRadius.circular(height * 0.012),
                        ),
                        alignment: Alignment.center,
                        height: height * 0.1,
                        width: double.infinity),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: height * 0.012),
                        padding:
                            EdgeInsets.symmetric(horizontal: height * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(26, 138, 134, 134),
                          ),
                          borderRadius: BorderRadius.circular(height * 0.012),
                        ),
                        alignment: Alignment.center,
                        height: height * 0.1,
                        width: double.infinity),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: height * 0.012),
                        padding:
                            EdgeInsets.symmetric(horizontal: height * 0.01),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(26, 138, 134, 134),
                          ),
                          borderRadius: BorderRadius.circular(height * 0.012),
                        ),
                        alignment: Alignment.center,
                        height: height * 0.1,
                        width: double.infinity),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
