module generators.descendingsequence;

public import std.range;

import tested;
import israndomgenerator;
import std.algorithm.comparison;

double previous = 10;

auto descendingSequence() {
  auto number = previous / 10;
  previous = previous - 1 == -1 ? 10 : previous - 1;
  return number;
}

@name("false for generator which returns the same sequence of descending numbers")
unittest {
  auto generator = generate!descendingSequence();

  auto result = isRandomGenerator(generator);
  assert(result == false);
}
