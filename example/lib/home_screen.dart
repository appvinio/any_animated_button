import 'package:any_animated_button/any_animated_button.dart';
import 'package:example/blocs/error_bloc.dart';
import 'package:example/blocs/short_bloc.dart';
import 'package:example/blocs/success_bloc.dart';
import 'package:example/buttons/minimalistic_button.dart';
import 'package:example/buttons/pretty_button.dart';
import 'package:example/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final SuccessBloc _successBloc;
  late final SuccessBloc _success2Bloc;
  late final ErrorBloc _errorBloc;
  late final ShortBloc _shortBloc;
  late final ShortBloc _enabledButton;
  late final ShortBloc _nullWidth;
  late final ShortBloc _infinityWidth;
  late final ShortBloc _fixedWidth;

  bool _enabled = false;

  @override
  void initState() {
    _successBloc = SuccessBloc();
    _success2Bloc = SuccessBloc();
    _errorBloc = ErrorBloc();
    _shortBloc = ShortBloc();
    _enabledButton = ShortBloc();
    _nullWidth = ShortBloc();
    _infinityWidth = ShortBloc();
    _fixedWidth = ShortBloc();

    super.initState();
  }

  @override
  void dispose() {
    _successBloc.close();
    _success2Bloc.close();
    _errorBloc.close();
    _shortBloc.close();
    _enabledButton.close();
    _nullWidth.close();
    _infinityWidth.close();
    _fixedWidth.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        AnyAnimatedButtonBlocListener<double, Failure>(
          bloc: _successBloc,
          onDefault: () {
            print('Default state');
          },
          onProgressStart: () {
            print('Progress state starts');
          },
          onProgressEnd: () {
            print('Progress state ends');
          },
          onSuccessStart: (double value) {
            print('Value: $value');
          },
          onSuccessEnd: (double value) {
            print('Value: $value');
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: PrettyButton(
                    bloc: _success2Bloc,
                    text: 'Send data!',
                    onTap: () => _success2Bloc.add(TriggerAnyAnimatedButtonEvent(1)),
                  ),
                ),
                const SizedBox(height: 32.0),
                MinimalisticButton(
                  text: 'Non animated button',
                  onTap: () {},
                ),
                const SizedBox(height: 12.0),
                MinimalisticButton(
                  bloc: _successBloc,
                  text: 'Animated success button',
                  onTap: () => _successBloc.add(TriggerAnyAnimatedButtonEvent(13)),
                ),
                const SizedBox(height: 12.0),
                MinimalisticButton(
                  bloc: _errorBloc,
                  text: 'Animated error button',
                  onTap: () => _errorBloc.add(TriggerAnyAnimatedButtonEvent(13)),
                ),
                const SizedBox(height: 12.0),
                MinimalisticButton(
                  bloc: _shortBloc,
                  text: 'Short animation button',
                  onTap: () => _shortBloc.add(TriggerAnyAnimatedButtonEvent(13)),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MinimalisticButton(
                      bloc: _enabledButton,
                      text: 'Enabled button',
                      enabled: _enabled,
                      onTap: () => _enabledButton.add(TriggerAnyAnimatedButtonEvent(13)),
                    ),
                    const SizedBox(width: 12.0),
                    MinimalisticButton(
                      text: _enabled ? '<- disable' : '<- enable',
                      onTap: () {
                        setState(() {
                          _enabled = !_enabled;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                MinimalisticButton(
                  bloc: _nullWidth,
                  text: 'width: null',
                  onTap: () => _nullWidth.add(TriggerAnyAnimatedButtonEvent(13)),
                ),
                const SizedBox(height: 12.0),
                MinimalisticButton(
                  bloc: _infinityWidth,
                  width: double.infinity,
                  text: 'width: double.infinity',
                  onTap: () => _infinityWidth.add(TriggerAnyAnimatedButtonEvent(13)),
                ),
                const SizedBox(height: 12.0),
                MinimalisticButton(
                  bloc: _fixedWidth,
                  width: 200.0,
                  text: 'width: 200.0',
                  onTap: () => _fixedWidth.add(TriggerAnyAnimatedButtonEvent(13)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
