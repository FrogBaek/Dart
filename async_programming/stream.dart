/* 
  Future는 하나의 함수에서 하나의 값만 반환
  (일반적인 다른 함수와 동일, 여러 값을 반환하려면 뭐 List같은 걸 써야겠지?)
  그래서 여러 순간에 여러 번 값을 받아내는 건 오로지 함수를 반복해서 쓰는 방법 뿐임!

  그래서 Stream이 개발됨
  Future와 다르게 함수가 끝날 때가 완료 순간이 아닌,
  직접적으로 닫아주는 순간이 완료 순간임!

  Stream에선 데이터가 계속 흐름.
  yield라는 키워드를 통해 계속 데이터를 받을 수 있음!
  어느 한 순간에 한 번만 받는 것이 아닌 계속 지속적으로 받을 수 있음!
  하지만 그만큼 복잡하긴 함
*/

// Stream을 사용하려면 패키지를 사용해야함!
import 'dart:async';

void main() {
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();
  // controller.stream은 기본적으로 한 번만 리스닝을 할 수 있는
  // 리소스가 생김
  // asBroad...를 쓰면 계속해서 여러번 리스닝을 할 수 있음
  // 그래서 아래처럼 listener를 두 개 쓸 수 있게 되는 거임

  // val 값이 들어오면 함수가 실행되는 거임
  final streamListener1 = stream.listen((val){
    print('Listener 1 : $val');
  });

  final streamListener2 = stream.listen((val) {
    print('Listener 2 : $val');
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}


/*-----------------------------------------------*/
void main2() {
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.where((val) => val % 2 == 0).listen((val){
    print('Listener 1 : $val');
  });

  final streamListener2 = stream.where((val) => val % 2 == 1).listen((val) {
    print('Listener 2 : $val');
  });
  // 중요!!! Stream은
  // Functional programming 처럼 바로 데이터가 들어오는 순간에
  // 변형을 주거나 데이터를 다룰 수 있음!!
  // 이렇게 where()를 이용하여 짝수와 홀수를 판별해서
  // Listener 1에는 짝수를, Lister 2에는 홀수만을 받을 수 있음!

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.sink.add(4);
  controller.sink.add(5);
}


/*-----------------------------------------------*/
// 중요!! 함수로 Stream 쓰는 방법
void main3() {
  calculate(2).listen((val) {
    print('calculate(2) : $val');
  });

  calculate(4).listen((val) {
    print('calculate(4) : $val');
  });
  // calculate(2)와 calculate(4)를 돌려봄으로써
  // 이 쓰레드가 전혀 막히지 않고 Future를 썼을 때와
  // 동일하다는 것을 알 수 있음!
}

// 만약 Future라면?
/* 
Future<int> calculate(int number) async {
  for (int i = 0; i < 5; i++){
    return i * number;
    // 기존의 Future 함수 방식이라면
    // 이렇게 리턴을 하나씩 일일이 다 받아야함!
  }
}
*/

// Stream 방식
Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++){
    yield i * number;
    // yield는 값을 하나하나 순서대로 가져오기 위해 쓰임

    // 일반적인 Future - async 함수를 async*로 된 함수에서 사용하는 법
    // 사실 그냥 async쓸 때랑 똑같음
    await Future.delayed(Duration(seconds: 1));
  }
}


/*-----------------------------------------------*/
// Future - await처럼 위의 main3(){}의 calculate()함수 또한
// 즉, Stream 함수 또안 await로 논리적으로 실행되게 하려면?
void main4() {
  playAllStream().listen((val) {
    print(val);
  });
  // 여담으로 끝에 ()를 붙여줘야 함수가 실행됨!
}

Stream<int> playAllStream() async* {
  yield* calculate(1);
  yield* calculate(1000);
  // yield*은 뒤에 해당되는 stream의 모든 값을 가져올 때까지 기다림!
  // 여기선 calculate(1) or calculate(1000) 인 거임
  // 마치 Future의 await와 비슷한 개념이지!
}

Stream<int> calculate2(int number) async* {
  for (int i = 0; i < 5; i++){
    yield i * number;
    // yield는 값을 하나하나 순서대로 가져오기 위해 쓰임

    await Future.delayed(Duration(seconds: 1));
  }
}
