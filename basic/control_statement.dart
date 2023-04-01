void main() {
// if 문
  int number = 3;

  if (number % 3 == 0) {
    print('나머지가 0입니다.');
  } else if (number % 3 == 1) {
    print('나머지가 1입니다.');
  } else {
    print('나머지가 2입니다.');
  }

/*-----------------------------------------------*/
  // switch문
  int number = 3;

  switch(number % 3){
    case 0:
      print('나머지가 0입니다.');
      break;

    case 1:
      print('나머지가 1입니다.');
      break;

    default:
      print('나머지가 2입니다.');
      break;
  }

/*-----------------------------------------------*/
  // for loop
  for(int i = 0; i < 10; i++){
    print(i);
  }

  int total = 0;

  List<int> numbers = [1, 2, 3, 4, 5];

  for(int i = 0; i < numbers.length; i++){
    total += numbers[i];
  }

  print(total);

  total = 0;

  for (int number in numbers) {
    total += number;
  }

  print(total);

  for(int i = 0; i < 10; i++){
    total += 1;

    if (total == 5){
      break;
    }
  }

  for (int i = 0; i < 10; i++){
    if (i == 5){
      continue;
    }
    print(i);
  }

  print(total);

/*-----------------------------------------------*/
  // while loop
  int total = 0;

  while(total < 10){
    total += 1;
  }

  print(total);

  total = 0;

  do {
    total += 1;
  } while (total < 10);
  // do(먼저 한 번 하고) while(~까지 실행)
  // do while문은 거의 안 씀

  print(total);

  while(total < 10){
    total += 1;

    if (total == 5){
      break;
    }
  }
}

/*-----------------------------------------------*/
// enum
enum Status{
  approved,
  pending,
  rejected
}

void main2() {
  Status status = Status.pending;
  // 그냥 String같은 타입으로 처리하면 되지 않으냐?
  // 기능은 똑같음 하지만 뉘앙스(사람의 입장에서) 차이가 생기므로
  // enum으로 관리하기 편한 경우 쓰게 될 거임

  if (status == Status.approved){
    print('승인입니다.');
  } else if (status == Status.pending){
    print('대기입니다.');
  } else {
    print('거절입니다.');
  }

/*-----------------------------------------------*/
  // function
  addNumbers(10, 30);

  addNumbers2(x: 10, z: 30, y: 20);
  addNumbers2(x: 10, y: 20);
}


// 세 개의 숫자 (x, y, z)를 더하고 짝수인지 홀수인지 알려주는 함수
// parameter / argument - 매개변수 / 인수(인자)
// positional parameter - 순서가 중요한 파라미터
//  ex. addNumbers(10, 20, 30);
// optional parameter - 있어도 되고 없어도 되는 파라미터


addNumbers(int x, [int y = 20, int? z]) {
  // optional parameter를 줄 때, int? 식으로 null값을 허용하면
  // sum 변수에서 null과 int를 더해야하는 에러가 발생하기 때문에
  // 기본값을 지정해주는 것이 좋음!
  int sum = x + y + z;
  // y는 정상, z는 에러 발생

  print('x : $x');
  print('y : $y');
  print('z : $z');

  if (sum % 2 == 0) {
    print('짝수입니다.');
  } else {
    print('홀수입니다.');
  }
}

// named parameter - 이름이 있는 파라미터 (순서가 중요하지 않다.)
addNumbers2(int x, {
  required int y,
  int z = 100
  // 이런 식으로 positional parmeter, optional parameter, named parameter 로 만들어 줄 수 있음!
}) {
  int sum = x + y + z;
}

// 함수의 return 타입을 void, int, double, String 등등으로 지정할 수 있음

/*-----------------------------------------------*/
// arrow function
// addNumbers3와 같은 함수임!
int addNumbers3(int x, {
  required int y,
  int z = 100
}) => x + y + z;


void main3 () {
  Operation operation = add;

  int result = operation(10, 20, 30);

  print(result);

  operation = substract;

  int result2 = operation(10, 20, 30);

  print(result2);

  int result3 = calculate(30, 40, 50, add);

  print(result3);

  int result4 = calculate(40, 50, 60, substract);

  print(result4);
}


/*-----------------------------------------------*/
// typedef
// signature
typedef Operation = int Function(
  int x, int y, int z
);

// 아래의 함수들은 typedef signature의 return타입과 parameter가 모두 일치해야함!

// 더하기
int add(int x, int y, int z) => x + y + z;

// 빼기
int substract(int x, int y, int z) => x - y -z;

// 실제로 쓰이는 예
int calculate(int x, int y, int z, Operation operation) => operation(x, y, z);