module generators.binary;

public import std.range;

import tested;
import israndomgenerator;
import std.random;

/**
  Randomly returns 0 or 1
*/
double binary()
{
  return uniform!"[]"(0, 1);
}

@name("true for a binary random number")
unittest {

  auto generator = generate!binary();

  const auto result = isRandomGenerator(generator);
  assert(result == true);
}
