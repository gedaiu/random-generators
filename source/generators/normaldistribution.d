module generators.normaldistribution;

version(advanced):

public import std.range;

import tested;
import israndomgenerator;
import std.random;
import std.algorithm.comparison;
import std.math;
import std.stdio;

private {
  double z0, z1;
  bool shouldGenerate;
}

/**
  Returns a random number, based on the normal distribution.
*/
double normal(double mu, double sigma)() {
  const double epsilon = double.min_normal;
  const double tau = 2 * PI;

  shouldGenerate = !shouldGenerate;

  if (!shouldGenerate)
  {
    auto randomNumber1 = z1 * sigma + mu;
    if (randomNumber1 < 0 || randomNumber1 > 1) return normal!(mu, sigma)();
    else return randomNumber1;
  }

  double u1, u2;
  do
  {
    u1 = uniform!("[]", double, double)(0,1);
    u2 = uniform!("[]", double, double)(0,1);
  }
  while( u1 <= epsilon);

  z0 = sqrt(-2.0 * log(u1)) * cos(tau * u2);
  z1 = sqrt(-2.0 * log(u1)) * sin(tau * u2);

  auto randomNumber2 = z0 * sigma + mu;
  if (randomNumber2 < 0 || randomNumber2 > 1) return normal!(mu, sigma)();
  else return randomNumber2;

}

@name("true for a normal distribution random generator")
unittest {
  alias normalDistribution = normal!(0.5, 0.15);

  auto generator = generate!normalDistribution();

  const auto result = isRandomGenerator(generator);
  assert(result == true);
}
