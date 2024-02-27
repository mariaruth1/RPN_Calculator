abstract class Command {
  void apply(List<num> stack);
}

class AddCommand implements Command {
  @override
  void apply(List<num> stack) {
    var result = stack.removeLast() + stack.removeLast();
    stack.add(double.parse(result.toStringAsFixed(8)));
  }
}

class SubtractCommand implements Command {
  @override
  void apply(List<num> stack) {
    var subtrahend = stack.removeLast();
    var minuend = stack.removeLast();
    stack.add(double.parse((minuend - subtrahend).toStringAsFixed(8)));
  }
}

class MultiplyCommand implements Command {
  @override
  void apply(List<num> stack) {
    var result = stack.removeLast() * stack.removeLast();
    stack.add(double.parse(result.toStringAsFixed(8)));
  }
}

class DivideCommand implements Command {
  @override
  void apply(List<num> stack) {
    var divisor = stack.removeLast();
    if (divisor == 0) throw Exception("Division by zero error");
    var dividend = stack.removeLast();
    stack.add(double.parse((dividend / divisor).toStringAsFixed(8)));
  }
}

class Calculator {
  List<num> stack;
  Calculator({required this.stack});

  void push(num value) {
    stack.add(value);
  }

  void execute(Command command) {
    command.apply(stack);
  }

  void clear() {
    stack.clear();
  }
}
