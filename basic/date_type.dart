void main () {
  // 정수
  int number1 = 10;

  print(number1);

  int number2 = 15;

  print(number2);

  int number3 = -20;

  print(number3);


  // 연산자
  print(number1 + number2);

  print(number1 - number2);

  print(number1 / number2);

  print(number1 * number2);


  // 실수
  double number4 = 2.5;
  double number5 = 0.5;


  // 참,거짓
  bool isTrue = true;
  bool isFalse = false;

  print(isTrue);
  print(isFalse);


  // 글자 타입
  String name = '에스파';
  String name2 = '전투개구리';

  print(name + name2);
  print(name + ' ' + name2);
  print('${name.runtimeType} $name2');

  var name3 = '에스파';
  var number = 20;

  print(name3.runtimeType);

  Map<String, Map<int, List<double>>> testType = {};
  var testType {};


  // dynamic vs var
  dynamic name = '전투개구리';
  dynamic number = 1;

  var name2 = '에스파';

  print(name.runtimeType);
  print(name.runtimeType);

  name = 2;

  name2 = 5;
  //var은 선언된 변수의 타입으로 정해지는데, 한 번 정해지면 수정 불가!


  // null

  // nullable - null이 될 수 있다.
  // non-nullable - null이 될 수 없다.
  // null - 아무런 값도 있지 않다.
  String name = '전투개구리';

  print(name);

  String? name2 = '에스파';

  name2 = null;

  print(name2);
  print(name2!);

  
  // final vs const
  final name = '전투개구리';
  
  print(name);

  const name2 = '에스파';

  print(name2);

  final DateTime now = DateTime.now();

  print(now);

  const DateTime now2 = DateTime.now();
}

