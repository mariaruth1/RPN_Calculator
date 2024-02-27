abstract class Command {
  void apply(List<num> stack);
}

class AddCommand implements Command {
  @override
  void apply(List<num> stack) {
    stack[0] = stack[1] + stack[0];
    stack.removeAt(1);
  }
}

class SubtractCommand implements Command {
  @override
  void apply(List<num> stack) {
    stack[0] = stack[1] - stack[0];
    stack.removeAt(1);
  }
}

class MultiplyCommand implements Command {
  @override
  void apply(List<num> stack) {
    stack[0] = stack[1] * stack[0];
    stack.removeAt(1);
  }
}

class DivideCommand implements Command {
  @override
  void apply(List<num> stack) {
    if (stack.contains(0)){
      stack[0] = 0;
    }
    else {
      stack[0] = stack[1] / stack[0];
    }
    stack.removeAt(1);
  }
}

class Calculator{
  List<num> stack = [];

  Calculator();

  push (num value){
    stack.insert(0, value);
    stack.add(value);
  }

  execute(Command command){
    if (stack.length >= 2) {
      command.apply(stack);
    } else {
      print("Error: Not enough elements in the stack for the operation.");
    }
  }

  clear(){
    stack = [];
  }
}
