void main() { 

  TestClassCase obj = TestClassCase();
  
  // obj.demo.forEach((element) {
  //   print("${element.getid()} --- ${element.name}");
  // });

  print(obj.demo[0].id);

}


//template of class 
class TestClass{
  int id;
  String name;

  TestClass({
    required this.id,
    required this.name
  });

  getid(){
    return id;
  }
}


class TestClassCase{

  
  List <TestClass> demo = [

    TestClass(id: 01, name: 'Rahin'),

    TestClass(id: 02, name: 'Nahin'),
  ];

}