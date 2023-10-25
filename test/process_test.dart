import 'package:f_web_authentication/ui/central.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';


// Una versión Mock de nuestro controlador, en ella podemos controlar los métodos
// y atributos para tener valores fijos contra lo que podamos probar

void main() {
  setUp(() {});
  testWidgets('Login', (WidgetTester tester) async {
    
    await tester.pumpWidget(Central());

    await tester.pump();

    expect(find.byKey(Key("EmailInput")),findsOneWidget);
  });
    testWidgets('Login fallido', (WidgetTester tester) async {
  });
    testWidgets('Sign Up', (WidgetTester tester) async {
  });
    testWidgets('Doing exercise', (WidgetTester tester) async {

  });
    testWidgets('Sign Up no internet', (WidgetTester tester) async {
  });
    testWidgets('Login no internet', (WidgetTester tester) async {

  });
}