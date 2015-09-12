module generators.uniform;

public import std.range;

import tested;
import israndomgenerator;
import std.algorithm.comparison;

ulong old = ulong.max / 4;

auto uniform(ulong a, ulong b)() {

  old = a * old + b;

  return (cast(double) old / cast(double) ulong.max);
}

@name("true for generator which returns uniform distribution")
unittest {
  alias customUniform = uniform!(36969, 18000);
  auto generator = generate!customUniform();

  auto result = isRandomGenerator(generator);
  assert(result == true);
}
