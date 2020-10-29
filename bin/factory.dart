import 'dart:math';

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);

    throw 'can\'t create $type';
  }

  num get area;
}

//shape factory

//Shape shapeFactory(String type) {
// if (type == "circle") return Circle(2);
// if (type == "square") return Square(2);

//throw 'can\'t create $type';
//}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  @override
  num get area => pi * pow(radius, 2);
}

class CircleMock implements Circle {
  @override
  num area;
  @override
  num radius;

  CircleMock({this.area, this.radius});

  void info() {
    print('area $area and radius $radius');
  }
}

class Square implements Shape {
  final num side;
  Square(this.side);
  @override
  num get area => pow(side, 2);
}

class Triangle implements Shape {
  final num side;
  Triangle(this.side);
  @override
  num get area => pow(side, 2) / 2;
}

/* variable as functions */
String what(int length) => "Wh${'a' * length}t";

void main() {
  try {
    final values = [1, 2, 3, 5, 10, 50];

    final square = Shape('square');
    print(square.area);

    final circle = Shape('circle');
    print(circle.area);

    CircleMock(area: 40, radius: 30).info();
    CircleMock(radius: 30).info();
    CircleMock().info();

    //what function
    print(what(6));

    print('\n');

    values.skip(1).take(3).map(what).forEach(print);

    print(Shape('triangle').area);
  } catch (err) {
    print(err);
  }
}
