module generators.descendingsequence;

public import std.range;

import tested;
import israndomgenerator;
import std.algorithm.comparison;

private double previous = 10;

/**
  Returns 1 for the first call, next calls will substract 0.1 from the previous
  returned value, after 0 is returned, it will start over.
*/
auto descendingSequence() {
  auto number = previous / 10;
  previous = previous - 1 == -1 ? 10 : previous - 1;
  return number;
}

@name("false for generator which returns the same sequence of descending numbers")
unittest {
  auto generator = generate!descendingSequence();

  const auto result = isRandomGenerator(generator);
  assert(result == false);
}
