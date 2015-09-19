module generators.constant;

public import std.range;

import tested;
import israndomgenerator;

/**
  Returns 0.5 constantwww
*/
double constant() {
  return 0.5;
}

@name("false for generator which always returns the same value")
unittest {
  auto generator = generate!constant();

  const auto result = isRandomGenerator(generator);
  assert(result == false);
}
