module generators.constant;

public import std.range;

import tested;
import israndomgenerator;

double constant() {
  return 0.5;
}

@name("it should return false for generator which always returns the same value")
unittest {
  auto generator = generate!constant();

  auto result = isRandomGenerator(generator);
  assert(result == false);
}
