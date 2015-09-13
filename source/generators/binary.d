module generators.binary;

public import std.range;

import tested;
import israndomgenerator;
import std.random;

double builtinuniform()
{
  return uniform!"[]"(0, 1);
}

@name("true for a binary random number")
unittest {

  auto generator = generate!builtinuniform();

  const auto result = isRandomGenerator(generator);
  assert(result == true);
}
