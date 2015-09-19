module generators.repeatingrandomsequence;

version(advanced):

public import std.range;

import tested;
import israndomgenerator;
import std.random;

private {
  enum SequenceLength = 100;
  double[SequenceLength] sequence;
}

shared static this() {
  foreach(i; 0..SequenceLength) {
    sequence[i] = uniform!("[]", double, double)(0, 1);
  }
}

private size_t index;

/**
  Returns a random number. After 100 calls will return the same numbers.
*/
auto repeatingRandomSequence() {
  auto nr = sequence[index];
  index++;
  if(index >= SequenceLength) {
    index = 0;
  }

  return nr;
}

@name("false for generator which returns same sequence of random numbers")
unittest {
  auto generator = generate!repeatingRandomSequence();

  const auto result = isRandomGenerator(generator);
  assert(result == false);
}
