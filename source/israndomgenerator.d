module israndomgenerator;

import std.stdio;
import std.range;
import std.array;
import std.conv;

int testNumber;

//TODO: create a function which generates CSVs from a generator

bool isRandomGenerator(T)(T generator) {
  testNumber++;

  auto sample = generator.take(10000).array;
  auto f = File("test" ~ testNumber.to!string ~ ".csv", "w");

  foreach(nr; sample)
    f.writeln(nr);

  //writeln("sample: ", sample);
  throw new Exception("Not implemented.");
}
