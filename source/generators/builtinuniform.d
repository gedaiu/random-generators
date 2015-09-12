module generators.builtinuniform;

public import std.range;

import tested;
import israndomgenerator;
import std.random;

double builtinuniform()
{
  return uniform(cast(double) 0, cast(double) 1);
}

@name("true for the built in D generator which returns uniform distribution")
unittest {

  auto generator = generate!builtinuniform();

  auto result = isRandomGenerator(generator);
  assert(result == true);
}
