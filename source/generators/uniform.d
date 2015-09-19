module generators.uniform;

public import std.range;

import tested;
import israndomgenerator;
import std.algorithm.comparison;

protected {
  enum A = 36969;
  enum B = 18000;

  ulong old = ulong.max / 4;
}
/**
  Pseudo random number generator implementation
*/
auto uniform(ulong a, ulong b)() {
  old = a * old + b;

  return (cast(double) old / cast(double) ulong.max);
}

@name("true for generator which returns uniform distribution")
unittest {
  alias custom_uniform = uniform!(A, B);
  auto generator = generate!custom_uniform();

  const auto result = isRandomGenerator(generator);
  assert(result == true);
}
