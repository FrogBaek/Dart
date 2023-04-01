void main() {
  TimesTwo tt = TimesTwo(2);

  print(tt.calculate());
  // 4 출력!

  TimtesFour tf = TimtesFour(2);

  print(tf.calculate());
}

// method - function (class 내부에 있는 함수)
// override - 덮어쓰다 (우선시 하다)
class TimesTwo{
  final int number;

  TimesTwo(
    this.number,
  );

  //method
  int calculate(){
    // 만약 calculate()라는 메소드 내에 number(중복되는 변수명)가 쓰이면
    // this.number로 리턴 해줘야 함(겹치지 때문!)
    // dart에서 이를 추천함!
    return number * 2;
  }
}


class TimtesFour extends TimesTwo{
  TimtesFour(
    int number,
  ) : super(number);

  // @override 자체도 생략가능하지만 직관적으로 알아보기 쉽게 하기 위해
  // 입력해주는 것이 좋음
  @override
  // 부모 클래스의 calculate() 시그니쳐와 동일하게 만들어야
  // 덮어씌우기 가능!
  int calculate() {
    // 정석: 부모 클래스의 값을 불러오는 것이므로 super를 써야함
    // 하지만 이미 timefour클래스에서 이미 상속을 했으므로
    // this를 써도 됨 => this.number
    // 하지만 앞서 설명했듯 this 또한 생략하여 number만 써도 됨
    // => number
    return super.number * 4;

    // 아래와 같이 calculate() 자체에 2를 곱하는 식으로 사용해도 됨!
    //return super.calculate() * 2;
    // 이 경우엔, 여기서 super 대신 this는 사용 못 함.
    // 그렇게 되면 무한히 자식 클래스의 calculate() 메소드가 실행됨
  }
}


/*-----------------------------------------------*/
void main2(){
  Employee karina = Employee('카리나');
  Employee winter = Employee('윈터');

  karina.name = '전투개구리';
  // 앞서 배웠었던 건데, 이런 걸 인스턴스 귀속이라고 표현!
  karina.printNameAndBuilding();
  winter.printNameAndBuilding();
  // 카리나의 이름만 변경했으므로 prinNameAndBuilding 메소드는
  // 카리나와 윈터가 서로 다름 => 인스턴스 귀속이니까, 더 넓은 범주인 class에는 영향 x!

  Employee.building = '오투타워';

  karina.printNameAndBuilding();
  winter.printNameAndBuilding();
  // Employee라는 클래스 자체에 다 귀속이 되므로 
  // 카리나, 윈터라는 인스턴스가 모두 변경됨!

  Employee.printBuilding();

}

// Static
class Employee {
  // static은 instance에 귀속되지 않고 class에 귀속된다.
  
  // 알바생이 일하고 있는 건물
  static String? building;
  // 알바생 이름
  String name;

  // 값을 받아줄 constructor 생성
  Employee(
    this.name,
  );

  void printNameAndBuilding() {
    print('제 이름은 $name입니다. $building 건물에서 근무하고 있습니다.');
  }

  static void printBuilding() {
    print('저희는 $building 건물에서 근무 중입니다.');
  }
}


/*-----------------------------------------------*/
void main3() {
  BoyGroup2 bts2 = BoyGroup2('BTS');
  GirlGroup2 redVelvet2 = GirlGroup2('레드벨벳');

  bts2.sayName();
  redVelvet2.sayName();

  // interface 또한 class의 상속 개념과 동일!
  print(bts2 is IdolInterface);
  print(bts2 is BoyGroup2);
  print(bts2 is GirlGroup2);
}

// interface
// 다른 언어에서는 interface라는 키워드를 사용하는 경우가 많으나
// dart에서는 class를 사용함
// 설계 구조를 강제하는 역할
// 인스턴스화를 목적으로 만든 클래스가 아님
// 그래서 추상화를 의미하는 abstract로 표시해주면
// 인터페이스 클래스가 실수로 인스턴스로써 사용되는 걸 방지할 수 있음!

abstract class IdolInterface{
  String name;

  IdolInterface(this.name);

  // 설계 형태만 강제하는 것이므로 구체적으로 정할 필요 없음
  // 메소드 또한 프로토타입만 지정해주면 됨
  void sayName();
  // abstract를 쓰게 되면 sayName 메소드의 바디 부분 또한 생략해줄 수 있음!
  // 대신 세미콜론 써줘야함
}

class BoyGroup2 implements IdolInterface{
  String name;

  BoyGroup2(this.name);

  void sayName() {
    print('제 이름은 $name입니다.');
  }
}

class GirlGroup2 implements IdolInterface{
  String name;

  GirlGroup2(this.name);

  void sayName() {
    print('제 이름은 $name입니다.');
  }
}


/*-----------------------------------------------*/
void main4 () {
  Lecture<String, String> lecture1 = Lecture('123', 'lecture1');

  lecture1.printIdType();

  Lecture<int, String> lecture2 = Lecture(123, 'lecture2');

  lecture2.printIdType();

}

// generic - 타입을 외부에서 받을 때 사용

// T든 Type이든 ABC든 무상관
// 아래와 같이 혼합해서 쓸 수 있음!
class Lecture<T, X>{
  final T id;
  final X name;
  late final String sex;

  Lecture(this.id, this.name, [String? sex = '']);

  void printIdType() {
    print(id.runtimeType);
  }

}


/*-----------------------------------------------*/
void main5() {
  Test test = Test();

  // Test 클래스가 비어있음에도 불구하고,
  // object의 메소드 4가지를 호출할 수 있음
  test.
}

// Object Oriented Programming (OOP)
// 객체지향 프로그래밍

// 모든 class는 object라는 클래스를를 상속함
// 그래서 Test라는 클래스 또한 class Test extends Object{} 인 것임!
// object{}를 상속함으로써 hashCode 등의 4가지 메소드를 기본적으로 제공!
// 여기서 object == 객체 이므로 객체지향 프로그래밍이라고 말하는 거임!

class Test {}