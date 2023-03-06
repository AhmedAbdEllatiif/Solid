import 'package:flutter/material.dart';
import 'package:solid_test/common/functions/show_snack_bar.dart';
import 'package:solid_test/di/git_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test/presentation/logic/cubit/change_color_cubit.dart';

import '../../widgets/salute_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ChangeColorCubit
  late final ChangeColorCubit _changeColorCubit;

  @override
  void initState() {
    super.initState();
    // init _changeColorCubit
    _changeColorCubit = getItInstance<ChangeColorCubit>();
  }

  @override
  void dispose() {
    // close _changeColorCubit
    _changeColorCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _changeColorCubit,
      child: Scaffold(
        body: GestureDetector(
          onTap: () => _changeCurrentColor(),
          child: BlocConsumer<ChangeColorCubit, ChangeColorState>(
            //==> listener
            listener: (context, state) {
              if (state is ColorChangedSuccessfully) {
                if (state.reachedNewFive) {
                  _showSnackBar(count: state.clickedCount);
                }
              }
            },

            //==> builder
            builder: (context, state) {
              return Container(
                color: state.bgColor,
                child: Center(
                  child: SaluteTextWidget(
                    textColor: state.textColor,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// try to change the current color
  void _changeCurrentColor() {
    _changeColorCubit.tryToChangeColor(accessToken: "accessToken");
  }

  /// to show a snackBar
  void _showSnackBar({required int count}) {
    showSnackBar(context, message: "Awesome you reached $count keep going");
  }
}
