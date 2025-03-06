import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';
import 'package:navigation/screen/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'HomeScreen',
      children: [
        OutlinedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return RouteOneScreen(
                      number: 20,
                  );
                },
              ),
            );

            print(result);
          },
          child: Text('push'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('Pop'),
        ),
        OutlinedButton(
          onPressed: () {
            /// 라우터 스택에 라우터가 남아있는 경우에만 pop해서 안전
            Navigator.of(context).maybePop(
                456
            );
          },
          child: Text('Maybe Pop'),
        ),
        OutlinedButton(
          onPressed: () {
            print(Navigator.of(context).canPop());
          },
          child: Text('Can Pop'),
        ),
      ],
    );
  }
}
