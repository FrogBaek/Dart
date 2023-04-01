void main() {
  Idol aespa = new Idol();

  print(aespa.name);
  print(aespa.members);
  aespa.sayHello();
  aespa.introduce();
  // 하지만 설계서인 class가 너무 제한적으로 주어짐..
}

// Idol class
// name (이름) - 변수
// members (멤버들) - 변수
// sayHello (인사) - 함수
// introduce (멤버소개) - 함수
// constructor (생성자)
class Idol {
  String name = '에스파';
  List<String> members = ['카리나', '윈터'];

  void sayHello() {
    print('안녕하세요 블랙핑크입니다.');
  }

  void introduce () {
    print('저희 멤버는 카리나, 윈터가 있습니다.');
  }
}


/*-----------------------------------------------*/
void main2() {
  Idol2 aespa2 = Idol2(
    '에스파',
    ['카리나', '윈터'],
  );

  Idol2 bts = Idol2(
    'BTS',
    ['RM', '진', '슈가', '뷔']
  );

  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();

  Idol2 redVelvet = Idol2.fromList(
    [
      ['웬디', '슬기'],
      'redVelvet'
    ]
  );
}

// constructor (생성자)
class Idol2 {
  String name;
  List<String> members;

  //constructor case 1
  Idol2(this.name, this.members);
  // type은 자동으로 유추해줌!

  //constructor case 2
  // Idol2(String name, List<String> members)
  //     : this.name = name,
  //       this.members = members;

  //constructor case 3
  // named constructor
  Idol2.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  // 위의 constructor들 중에 맘에 드는 걸로 ㄱㄱ~ 

  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }

  void introduce () {
    print('저희 멤버는 ${this.members}가 있습니다.');
  }
}


/*-----------------------------------------------*/
void main3() {
  // const constructor
  // 이제 aespa3는 한 번 선언된 이후 값 변경 불가!
  // 빌드 타임에 값을 알 수 있어야 const를 쓸 수 있으므로
  // DateTime.now() 등은 아무리 toString()으로 변환을 하더라도
  // 런 타임에 결정되는 메서드이므로 const 사용 불가!
  Idol3 aespa3 = const Idol3(
    '에스파',
    ['카리나', '윈터']
  );

  Idol3 aespa4 = const Idol3(
    '에스파',
    ['카리나', '윈터']
  );

  print(aespa3 == aespa4);
  // true 출력
  // 이유 : 둘 다 const로 선언했기에(그리고 멤버나 이름 같은 값도 같기에)
  //        같은 인스턴스로 취급함! (같은 메모리 사용!)
  //        만일, const를 사용하지 않았더라면 aespa3와 aespa4는 서로 다른
  //        인스턴스로 취급되어서 비교했을 때 다른 값이 나왔을 것임

  aespa3.name = '전투개구리';
  // 이런 식으로 객체의 값을 변경할 수 있음
  // 개발자들이 이를 싫어하므로 immutable programming을 해줘야함!
  // final로 설정하니까 aespa3.name에 오류!
}

// immutable (불변 객체)
// final, const 등
// 실제 개발할 때, final로 객체 생성하는 것을 습관들여야 함
// 버그를 방지할 수 있기 때문에!
// const는 constructor에 주로 씀!
class Idol3 {
  final String name;
  final List<String> members;

  const Idol3(this.name, this.members);

  Idol3.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }

  void introduce () {
    print('저희 멤버는 ${this.members}가 있습니다.');
  }
}


/*-----------------------------------------------*/
void main4() {
  Idol4 aespa3 = Idol4(
    '에스파',
    ['카리나', '윈터']
  );

  print(aespa3.firstMember);
  // '카리나' 출력

  aespa3.firstMember = '전투개구리';
  print(aespa3.firstMember);
  // '전투개구리' 출력
}

// getter / setter
// 데이터를 가져올 때 / 데이터를 설정할 때
class Idol4 {
  String name;
  List<String> members;

  Idol4(this.name, this.members);

  Idol4.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }

  void introduce () {
    print('저희 멤버는 ${this.members}가 있습니다.');
  }

  String getFirstMember() {
    return this.members[0];
  }
  // getFirstMember()와 firstMember의 차이점은
  // 뉘앙스(인간 기준)의 차이임! 기능 차이는 아예 없음!!

  // getter
  String get firstMember{
    return this.members[0];
  }

  // setter
  set firstMember(String name){
    this.members[0] = name;
  }
  // setter를 사용하게 되면, 애초에 immutable 프로그래밍의 원칙을
  // 깨게 됨(객체의 값을 변경하므로)! 그래서 현대 프로그래밍에서는
  // setter를 잘 안 씀!!
}


/*-----------------------------------------------*/
void main5() {
  _Idol5 aespa5 = _Idol5(
    '에스파',
    ['카리나', '윈터']
  );

}

// private 값
// 이 class.dart라는 파일에서만 사용가능하게 됨!
// class도 물론, 어떠한 변수여도 private 값으로 설정 가능!
class _Idol5 {
  String name;
  List<String> members;

  _Idol5(this.name, this.members);

  _Idol5.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }

  void introduce () {
    print('저희 멤버는 ${this.members}가 있습니다.');
  }

  String getFirstMember() {
    return this.members[0];
  }
  // getFirstMember()와 firstMember의 차이점은
  // 뉘앙스(인간 기준)의 차이임! 기능 차이는 아예 없음!!

  // getter
  String get firstMember{
    return this.members[0];
  }

  // setter
  set firstMember(String name){
    this.members[0] = name;
  }
  // setter를 사용하게 되면, 애초에 immutable 프로그래밍의 원칙을
  // 깨게 됨(객체의 값을 변경하므로)! 그래서 현대 프로그래밍에서는
  // setter를 잘 안 씀!!
}


/*-----------------------------------------------*/
void main6() {
  print('------- Idol -------');
  Idol6 apink = Idol6(name: '에이핑크', membersCount: 5);

  apink.sayName();
  apink.sayMembersCount();
  apink.sayMale(); 
  // 중요!!!! 자식 클래스에서 부모 클래스로 속성을 넘겨줄 순 없기에
  // 오류 발생!

  print('------- Boy Group -------');
  BoyGroup bts = BoyGroup('BTS', 7);

  // 자식 클래스에 선언되지 않은 메소드들도
  // 부모 클래스에 선언되어 있으면 사용 가능!
  bts.sayMembersCount();
  bts.sayName();
  bts.sayMale();

  print('------- Girl Group -------');
  GirlGroup blackPink = GirlGroup('BlackPink', 4);

  blackPink.sayName();
  blackPink.sayMembersCount();
  blackPink.sayFemale();
  blackPink.sayMale();
  // 중요!!! Boy Group과 Girl Group 자식 클래스끼리는 서로 속성 공유하지 않음!

  print('------- Type Comparison -------');
  print(apink is Idol6);
  // true 출력
  print(apink is BoyGroup);
  // false 출력 - 부모이기 때문에!
  print(apink is GirlGroup);
  // false 출력 - 부모이기 때문에!

  print('------- Type Comparison 2 -------');
  print(bts is Idol6);
  // true 출력 - 부모의 자식이기 때문에!
  print(bts is BoyGroup);
  // true 출력
  print(bts is GirlGroup);
  // false 출력 - 자식끼리 속성 다름!

  print('------- Type Comparison 3 -------');
  print(blackPink is Idol6);
  // true 출력 - 부모의 자식이기 때문에!
  print(blackPink is BoyGroup);
  // false 출력 - 자식끼리 속성 다름!
  print(blackPink is GirlGroup);
  // true 출력
}

// OOP의 꽃!!!!! 굉장히 중요!
// 상속 - inheritance
// 상속을 받으면 부모 클래스의 모든 속성을 자식 클래스가 부여받는다.
class Idol6{
  //이름
  String name;
  // 멤버 숫자
  int membersCount;

  Idol6({
    required this.name,
    required this.membersCount
  });

  void sayName() {
    print('저는 ${this.name}입니다.');
  }

  void sayMembersCount() {
    print('${this.name}은 ${this.membersCount}명의 멤버가 있습니다.');
  }
}

// 부모 class인 Idol6로부터 자식 class인 BoyGroup 생성
class BoyGroup extends Idol6{
  // constructor 생성
  BoyGroup(
    String name,
    int membersCount,
  ): super(
        name: name,
        membersCount: membersCount,
      );
      // name과 membersCount를 부모에게 전달해주는 거임!
  //super()은 Idol6의 constructor를 의미함
  //원래 constructor는 아래처럼 썼었는데, 상속이므로 this가 아닌 super를 사용
  //this.name = name, this.membersCount = membersCount;

  void sayMale() {
    print('저희는 남자 아이돌입니다.');
  }
}

class GirlGroup extends Idol6 {
  GirlGroup(
    String name,
    int membersCount,
  ): super(
        name: name,
        membersCount: membersCount
      );

  void sayFemale() {
    print('저희는 여자 아이돌입니다.');
  }
}