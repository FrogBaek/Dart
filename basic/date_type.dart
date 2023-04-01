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

  var z = 1;
  z = '이미 선언과 동시에 int로 초기화 했기에 타입 변경 불가';
  
  dynamic c = 3;
  // 선언과 동시에 int로 초기화 했음에도 dynamic이기에 타입 변경 가능
  c = 3.0;
  
  
  // 하지만 선언 후, 초기화를 하는 경우에는 var이나 dynamic이나 같음!
  var x;
  
  print(x);
  
  x = 1.0;
  print(x);
  
  x = 'Hi';
  print(x);
  
  x = false;
  print(x);
  
  
  dynamic y;
  
  print(y);
  
  y = 1.0;
  print(y);
  
  y = 'Hi';
  print(y);
  
  y = true;
  print(y);


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

  double? number = 4.0;

  number = null;

  number ??= 3.0;
  
  
  // final vs const
  final name = '전투개구리';
  
  print(name);

  const name2 = '에스파';

  print(name2);

  final DateTime now = DateTime.now();

  print(now);

  const DateTime now2 = DateTime.now();





  // Operator
  int numberA = 1;
  int numberB = 2;

  print(numberA > numberB);
  print(numberA < numberB);
  print(numberA >= numberB);
  print(numberA <= numberB);
  print(numberA == numberB);
  print(numberA != numberB);


  //Type 비교
  int numberC = 1;

  print(numberC is int);
  print(numberC is String);

  print(numberC is! int);
  print(numberC is! String);


  // 비교 연산자
  bool result = 12 > 18 && 1 > 0;

  print(result);

  bool result2 = 12 > 18 && 0 > 1;

  print(result2);

  bool result3 = 12 > 18 || 1 > 0;

  print(result3);

  bool result4 = 12 < 18 || 1 < 0;

  print(result4);

  bool result5 = 12 < 18 && 1 > 0;

  print(result5);


  // List
  List<String> aespa = ['카리나', '윈터'];
  List<int> numbers = [1, 2, 3, 4, 5];

  print(aespa);
  print(numbers);

  // index
  print(aespa[0]);
  print(aespa[1]);
  print(aespa[2]);
  // Index out of range: 존재하지 않으므로 오류 발생!

  print(aespa.length);

  aespa.add('닝닝');

  print(aespa);

  aespa.remove('닝닝');

  print(aespa);

  print(aespa.indexOf('윈터'));
  // 몇 번째 인덱스에 존재하는지!

  
  // Map (Key - value)
  Map<String, String> dictionary = {
    'Combat Frog': '전투개구리',
    'Frozen Frog': '얼어붙은 개구리',
    'Frog': '개구리'
  };

  print(dictionary);

  Map<String, bool> isCombarFrog = {
    'Combat Frog': true,
    'Frozen Frog': false,
    'Frog': false
  }

  print(isCombarFrog);

  isCombarFrog.addAll({
    'Horse': false,
    'Zebra': false,
  });

  print(isCombarFrog);

  print(isCombarFrog['Horse']);
  // 항상 value가 아닌 key로 인덱싱!!

  isCombarFrog['Elephant'] = false;
  // 이렇게 추가도 가능

  print(isCombarFrog);

  isCombarFrog['Hores'] = true;
  // 이렇게 수정도 가능

  isCombarFrog.remove('Frog');
  // 이렇게 삭제도 가능

  print(isCombarFrog);

  print(isCombarFrog.keys);
  // key들만 가져오기

  print(isCombarFrog.values);
  // value들만 가져오기

  
  // Set
  // List와 거의 동일한데, List와는 다르게 중복 값을 받지 않음
  // 즉, 자동으로 중복 처리해줌!
  final Set<String> names = {
    'Combat Frog',
    'Flutter',
    'Aespa',
    'Flutter'
    // 같은 값이 들어갔으므로 오류 발생!
  };

  print(names);

  names.add('Winter');

  print(names);

  names.remove('Winter');

  print(names);

  print(names.contains('Flutter'));


}