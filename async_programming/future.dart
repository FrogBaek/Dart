/*
  Thread => 작업을 하는 가장 작은 Unit
  기존의 오래된 프로그래밍 언어들의 기본값은 Synchronous Programming임
  사실 프로그래밍을 하는데에 있어서 동기냐 비동기냐는 크게 신경 안 써도 될 문제
  하지만 '서버 요청'에서 만큼은 이 문제가 중요해짐
  이 쓰레드라는 건 한 가지 작업을 하게 될 때, 다른 작업은 할 수 없는 유닛인데
  다른 건 몰라도 서버 요청 시에는 사실 데이터를 요청만 하고 기다리는 건데
  쓰레드는 이를 데이터를 받을 때까지 일하는 걸로 인식해서 서버요청을 하고 받는 순간까지
  한 가지의 작업으로 인식하므로 다른 일을 못하게 됨
  한 마디로 CPU가 놀아버리므로 비효율적이고 리소를 낭비하게 되는 거임
  이러한 점을 해결하기 위해 Async Programming 등장!
  현대적 프로그래밍에 있어서 없어서는 안 될 중요한 요소!
*/


// Sychronous
void main () {
  addNumbers(1, 1);
  addNumbers(2, 2);
}

// 1 + 1 = 2
// 2 + 2 = 4
void addNumbers(int number1, int number2){
  print('계산중: $number1 + $number2');

  print('계산 완료: ${number1 + number2}');
}


/*-----------------------------------------------*/
// Asynchronous
void main2() {
  // Future - 미래
  // 미래에 받아올 값
  Future<String> name = Future.value('전투개구리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  addNumbers2(1, 1);
  addNumbers2(2, 2);
}

void addNumbers2(int number3, int number4){
  print('계산 시작 : $number3 + $number4');

  // 2개의 파라미터
  // delayed - 지연되다
  // 1번 파라미터 - 지연할 기간 (얼마나 지연할 건지) Duration
  // 2번 파라미터 - 지연 시간이 지난 후 실행할 함수.

  // 서버 시뮬레이션
  Future.delayed(Duration(seconds: 2), (){
    print('계산 완료: $number3 + $number4 = ${number3 + number4}');
  });

  print('함수 완료');
}
// Future로 인해 2초 딜레이 후에 계산 완료가 출력됨
// 2초가 지난 후에 다시 돌아와서 Future delay 내부의 함수를 실행하는 거임!


/*-----------------------------------------------*/
// await - 원리
void main3() {
  addNumbers3(1, 1);
  addNumbers3(2, 2);
}

void addNumbers3(int number5, int number6) async {
  print('계산 시작 : $number5 + $number6');

  // await를 사용해서 async 코드를 논리적으로 기다릴 수 있다!
  // 그 기다리는 순간동안 CPU는 노는 게 아니고 다른 작업을 할 수 있다!
  // 그래서 addNumbers3(1, 1)의 내부는 await로 인해 그 다음으로 넘어가지 않았지만
  // 그 밖의 다른 함수인 addNumbers3(2, 2)함수를 실행함!
  // 그리고 나서 2초가 지난 후에 addNumbers3(1, 1)의 await 및 '함수 완료'를 출력한 후,
  // addNumbers3(2, 2)의 나머지 함수들을 출력한 거임!
  await Future.delayed(Duration(seconds: 2), (){
    print('계산 완료 : $number5 + $number6 = ${number5 + number6}');
  });

  print('함수 완료 : $number5 + $number6');
}


/*-----------------------------------------------*/
// await - 응용
void main4() async {
  await addNumbers4(1, 1);
  await addNumbers4(2, 2);
  // await를 쓰려면 return값이 Future여야 하므로
  // 함수의 반환 값을 void가 아닌, Future로 바꿔주어야함!

  // 실행하게 되면, addNumbers(1, 1)이 모두 끝난 다음에
  // addNumbers(2, 2)가 실행됨!
  // await 덕분에 인간 입장에서도 논리적으로 비동기적 실행이
  // 되는 것을 알 수 있음!
}

Future<void> addNumbers4(int number7, int number8) async {
  print('계산 시작 : $number7 + $number8');

  await Future.delayed(Duration(seconds: 2), (){
    print('계산 완료 : $number7 + $number8 = ${number7 + number8}');
  });

  print('함수 완료 : $number7 + $number8');
}


/*-----------------------------------------------*/
// Future return type
void main5() async {
  Future<String> name = Future.value('전투개구리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  final result1 = await addNumbers5(1, 1);
  final result2 = await addNumbers5(2, 2);

  print('result1 : $result1');
  print('result2 : $result2');
  print('result1 + result2 = ${result1 + result2}');  
}

// 
Future<int> addNumbers5(int number9, int number10) async {
  print('계산 시작 : $number9 + $number10');

  Future.delayed(Duration(seconds: 2), (){
    print('계산 완료: $number9 + $number10 = ${number9 + number10}');
  });

  print('함수 완료');

  return number9 + number10;
  // 자동으로 number9 + number10의 값을 Future에 감싸서
  // 함수가 return을 해줌 - 똑똑한 언어임
}