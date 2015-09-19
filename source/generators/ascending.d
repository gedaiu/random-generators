module generators.ascending;

public import std.range;

import tested;
import israndomgenerator;
import std.random;
import std.algorithm.comparison;

private double previous = 0;

/**
  Returns a random number. If a random number was already returned, the new
  generated number will be larger than previous number but not bigger than 1.
*/
auto ascending() {
  auto random = uniform(previous, min(previous+0.001,1));
  previous = random;
  return random;
}

@name("false for generator which always returns a value equal to or larger than the previous")
unittest {
  auto generator = generate!ascending();

  const auto result = isRandomGenerator(generator);
  assert(result == false);
}
