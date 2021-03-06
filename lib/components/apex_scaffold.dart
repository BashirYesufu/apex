import 'package:apex/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../utilities/provider/providers/loading_provider.dart';
import 'apex_back_button.dart';

class ApexScaffold extends StatelessWidget {
  final List<Widget> children;
  final Color appBarColor;
  final Color backgroundColor;
  final Widget? bottomNavBar;
  final bool hasBackButton;
  final List<Widget>? trailing;
  final Function()? onBackPressed;

  const ApexScaffold({
    required this.children,
    this.appBarColor = ApexColors.white,
    this.backgroundColor = ApexColors.white,
    this.bottomNavBar,
    this.hasBackButton = true,
    this.trailing,
    this.onBackPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingProvider = Provider.of<LoadingStateProvider>(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ModalProgressHUD(
        inAsyncCall: loadingProvider.loading,
        progressIndicator: LoadingAnimationWidget.fourRotatingDots(
          color: ApexColors.orange,
          size: 100.0,
        ),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: appBarColor,
            appBar: AppBar(
              backgroundColor: backgroundColor,
              elevation: 0,
              centerTitle: true,
              leading: hasBackButton
                  ? ApexBackButton(onPressed:
              onBackPressed ?? ()=> Navigator.pop(context)
              ,)
                  : SizedBox(),
              actions: trailing,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: children,
                  ),
                ),
              ),
            ),
            bottomNavigationBar: SafeArea(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: bottomNavBar ?? SizedBox(),
            )),
          ),
        ),
      ),
    );
  }
}
