module generators.nonrandomintervals;

version(advanced):

public import std.range;

import tested;
import israndomgenerator;
import std.random;

private size_t index;

/**
  The first 50 calls will return a random number, the next 5 will return
  0.5, 0.51, 0.52, 0.53, 0.54, then will return another 50 random numbers and
  so on.
*/
double nonrandomintervals() {
  double nr;

  if(index < 50) {
    nr = uniform!("[]", double, double)(0, 1);
  } else {
    nr = index / 100.;
  }

  index++;

  if(index > 54) {
    index = 0;
  }

  return nr;
}

@name("false for a generator that sometimes returns the same numbers")
unittest {
  auto generator = generate!nonrandomintervals();

  const auto result = isRandomGenerator(generator);
  assert(result == false);
}
