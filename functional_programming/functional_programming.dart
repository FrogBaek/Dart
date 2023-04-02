void main() {
  List<String> aespa = ['카리나', '윈터', '윈터'];

  print(aespa);
  print(aespa.asMap());
  // key에는 0부터 시작하는 index가, value에는 원래의 값들이 들어감
  print(aespa.toSet());
  // 중복되는 값이 하나로 통일되는 Set으로 변경됨

  Map<dynamic, String> aespaMap = aespa.asMap();

  // iterable(=> interface) vs collection(List, Map, Set)
  // keys에 마우스 커서를 대면 Iterable이 나오는데,
  // Iterable은 일종의 List같은 형태임. 근데 자주 쓰이진 않음
  // 보통은 List로 변환해서 자주 씀, 그래서 toList()
  print(aespaMap.keys.toList());
  print(aespaMap.values.toList());

  // List로부터 Set를 만드는 방법 中 하나
  Set<String> aespaSet = Set.from(aespa);

  print(aespaSet.toList());


  /*-----------------------------------------------*/
  // List의 경우 매핑하는 법
  List<String> blackPink = ['로제', '지수', '제니'];

  final newBlackPink = blackPink.map((x){
    return '블랙핑크 $x';
  });
  
  print(blackPink);
  print(newBlackPink.toList());

  final newBlackPink2 = blackPink.map((x) => '블랙핑크 $x');
  // arrow 함수 사용!

  print(newBlackPink2.toList());

  print(blackPink == blackPink);
  print(newBlackPink == blackPink);
  // newBlackPink에 toList()메소드를 붙여도 결과는 false임
  print(newBlackPink == newBlackPink2);
  // 중요!!! 이렇듯 map()메소드로 '매핑'을 하면 새로운 리스트가 생김을 알 수 있다!

  // [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg]
  String number = '13579';

  final parsed = number.split('');
  // split()은 값을 하나의 글자로 나누어서 List로 변경해줌!

  print(parsed);
  // [1, 3, 5, 7, 9] 출력

  final paresd = number.split('').map((x) => '$x.jpg').toList();
  // 한 줄만에 [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg] 이렇게 만들어버림; 개꿀


  /*-----------------------------------------------*/
  // Map의 경우 매핑하는 법
  Map<String, String> harryPotter = {
    'Harry Potter': '해리 포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저'
  };

  // 하지만 아래와 같이 Map을 매핑하는 경우는 잘 없음!
  final result = harryPotter.map(
    (key, value) => MapEntry(
      'Harry Potter Character $key',
      '해리포터 캐릭터 $value',
    ),
  );

  print(harryPotter);
  print(result);
  
  final keys = harryPotter.keys;
  // iterable 형태

  print(keys);

  final keys = harryPotter.keys.map((x) => 'HPC $x').toList();
  final values = harryPotter.values.map((x) => '해리포터 $x').toList();

  print(keys);
  print(values);


  /*-----------------------------------------------*/
  // Set의 경우 매핑하는 법(List와 흡사함)
  Set blackPinkSet = {
    '로제',
    '지수',
    '제니'
  };
  
  final newSet = blackPinkSet.map((x) => '블랙핑크 $x').toSet();

  print(newSet);


  /*-----------------------------------------------*/
  // where()
  // 중요!! 굉장히 많이 쓰는 기능 중 하나임~!
  List<Map<String, String>> people = [
    {
      'name': '로제',
      'group': '블랙핑크'
    },
    {
      'name': '지수',
      'group': '블랙핑크'
    },
    {
      'name': 'RM',
      'group': 'BTS'
    },
    {
      'name': '뷔',
      'group': 'BTS'
    },
  ];

  print(people);

  // 작동하는 방식은 map(매핑)이랑 같음!
  final blackPinkResult = people.where((x) => x['group'] == '블랙핑크');
  // List의 map들을 다 looping하면서 true/false값을 돌려줌
  // true 값을 돌려주면 값을 유지,
  // false 값을 돌려주면 값을 삭제해줌
  final btsResult = people.where((x) => x['group'] == 'BTS').toList();

  print(blackPinkResult.toList());
  // 로제와 지수만 남아있음!


  /*-----------------------------------------------*/
  // reduce()
  List<int> numbers = [
    1,
    3,
    5,
    7,
    9,
  ];

  // 원리를 보여주기 위해 상세하게 적어놓은 것
  final result2 = numbers.reduce((prev, next) {
    print('------------------');
    print('previous : $prev');
    print('next : $next');
    print('total : ${prev + next}');

    return prev + next;
  });

  print(result2);
  // 맨 처음의 prev에는 numbers의 첫 번째 값인 1이 들어가고
  // 그 이후부터는 return 값인 prev + next 값이 들어가게 된다
  // next는 두 번쨰부터 순서대로 들어가게 됨!
  // 그리고 마지막엔 return 값인 25 출력됨!

  final result3 = numbers.reduce((prev, next) => prev + next);
  
  print(result3);
  // 25 출력!

  // 실사용 예시
  List<String> words = [
    '안녕하세요 ',
    '저는 ',
    '전투개구리입니다.',
  ];

  final sentence = words.reduce((prev, next) => prev + next);

  print(sentence);
  // 안녕하세요 저는 전투개구리입니다. 출력!

  // reduce()가 실행할 수 없는 경우
  words.reduce((prev, next) => prev.length + next.length);
  // 원하는 return type이 int인데 return 타입이 원래의 반환 값인 String이어야 한다는 것!
  // 중요!!! reduce()를 쓸 때는 항상 List의 멤버들의 타입과 같은 타입이어야 한다는 것을 잊지 말아야함!


  /*-----------------------------------------------*/
  // fold()
  // 바로 reduce()의 위의 단점을 보완할 수 있음(추가적으로 fold로 reduce를 만들 수 있음)
  List<int> numbers2 = [1, 3, 5, 7, 9];

  final sum = numbers2.fold<int>(0, (prev, next) => prev + next);

  print(sum);

  // 작동 방식: reduce와 나머지는 동일한데 다른 점 한 가지는
  // 첫 번째 값으로는 맨 앞 파라미터가(이 경우엔 0) 들어가고,
  // 두 번째 값으로는 numbers2의 첫 번째 값인 1이 들어간다는 점임!
  final sum2 = numbers2.fold<int>(0, (prev, next) {
    print('---------------');
    print('prev: $prev');
    print('next: $next');
    print('total: ${prev + next}');

    return prev + next;
  });

  final sum3 = numbers2.fold<int>(0, (prev, next) => prev + next);

  print(sum3);

  List<String> words2 = [
    '안녕하세요 ',
    '저는 ',
    '전투개구리입니다.',
  ];

  final sentence2 = words2.fold<String>('', (prev, next) => prev + next);

  print(sentence2);

  final count = words2.fold<int>(0, (prev, next) => prev + next.length);
  // 위의 reduce()에선 못하던 걸 해내게 됨!

  print(count);


  /*-----------------------------------------------*/
  // cascading operator
  List<int> even = [
    2, 4, 6, 8,
  ]; 

  List<int> odd = [
    1, 3, 5, 7,
  ];

  // cascading operator
  // ...
  print([...even, ...odd]);
  print(even);
  print([...even]);
  // 바로 위 두 개는 출력 값이 동일함!
  print(even == [...even]);
  // 하지만 비교를 해보면 같지 않다고 나옴!
  // 그 말은 즉슨, cascading operaotor는 완전히 새로운 List에 값을 풀어준다는 것이 증명됨!


  /*-----------------------------------------------*/
  // 최종적으로 functional programming을 하는 것이란?
  // 아래처럼 연결되게 return된 값을 가지고 계속 새로운 값을 만들어낼 수 있음!
  // 무한하게 리턴 되는 값으로 변형을 주면서 계속 이어나갈 수 있음
  // 이게 함수형 프로그래밍의 장점임!
  // OOP랑 함수형 플밍 중 뭐가 더 우세?
  // 둘 다 중요! 둘 다 쓰게 됨!!
  // 함수형 플밍의 기본은
  // 1. 실행하는 대상(List, Set, Map)과는 완전히 다른 새로운 값을 생성해준다
  // 2. 매번 새롭게 chaining 할 수 있다!
  // 주의사항은
  //  코드가 간결해지는 것에 심취해서 너무 많이 연동해버리면
  //  다른 사람은 물론 본인이 코드를 다시 보게 될 때, 헷갈릴 수 있음
  //  그래서 길어지면 주석을 달고 하는 등의 행위를 해야 헷갈리지 않음!

  List<Map<String, String>> people2 = [
    {
      'name': '로제',
      'group': '블랙핑크',
      'test': '테스트'
    },
    {
      'name': '지수',
      'group2': '블랙핑크'
    },
    {
      'name': 'RM',
      'group': 'BTS'
    },
    {
      'name': '뷔',
      'group': 'BTS'
    },
  ];
  // 자유도가 너무 높아서 이를 프로그래밍적으로 구조화 시켜야함
  // 그 과정으로 함수형 프로그래밍을 하게 되는 거임!

  print(people2);

  final parsedPeople = people2.map(
    (x) => Person(
      // 사람이 봤을 땐, key가 존재하는 게 분명하지만
      // 기계가 판단했을 땐, 무슨 값이 들어갈지 모르므로 에러 발생
      // 그래서 !로 강제로 값이 있다고 알려주면 됨!
      name: x['name']!, 
      group: x['group']!, 
      )).toList();

  print(parsedPeople);
  // 아래의 Person class에서 @override한 toString()덕분에
  // Instance of 'Person' => Person(name: 지수, group: 블랙핑크)
  // 로 출력됨~~ 대박!

  // for(Person person in parsedPeople){
  //   print(person.name);
  //   print(person.group);
  // }

  final bts = parsedPeople.where(
    // 이미 x가 Person이라는 것을 알고 있기에 group이라는 키워드를 가져올 수 있게 됨.
    (x) => x.group == 'BTS',
    );

    print(bts);
    // BTS에 해당하는 값만 출력!
    // Person(name:RM, group:BTS) 등

    // 위에서 걸쳤던 두 번의 작업을 한 번에 이렇게 할 수도 있음!
    final finalResult = people2.map(
      (x) => Person(
        name: x['name']!,
        group: x['group']!,
      ),
      // Person으로 파싱이 되어있는 상태이므로 x.group이 가능한 거임
      ).where((x) => x.group == 'BTS');
      // 여기서 또 fold와 같은 걸 연계할 수 있음!
      // 이게 함수형 프로그래밍의 장점!!

      print(finalResult);
}

// class를 생성해주지 않으면 위와 같은 people2 데이터를
// 필요로 할 때마다 항상 !를 붙여주면서 저렇게 호출해야줘야함 ㅠ
// 그래서 클래스를 쓰는 거임(ex. UserModel)
class Person {
  final String name;
  final String group;

  Person({
    required this.name,
    required this.group,
  });

  @override
  String toString(){
    return 'Person(name: $name, group: $group)';

  }
}