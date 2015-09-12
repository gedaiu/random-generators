module israndomgenerator;

import std.stdio;
import std.range;
import std.array;

bool isRandomGenerator(T)(T generator) {
  auto sample = generator.take(100).array;

  writeln("sample: ", sample);
  throw new Exception("Not implemented.");
}
