module israndomgenerator;

import std.stdio;
import std.range;
import std.array;
import std.conv;

import tools;

private int testNumber;

/**
  A function that determines if a Range is a random number generator
*/
bool isRandomGenerator(T)(T generator) {
  testNumber++;

  auto sample = generator.take(1000).array;

  sample.toCsv("./data/test" ~ testNumber.to!string ~ ".csv");
  sample.toHistCsv("./data/hist" ~ testNumber.to!string ~ ".csv", 0.1);

  throw new Exception("Not implemented");
}
