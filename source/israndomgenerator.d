module israndomgenerator;

import std.stdio;
import std.range;
import std.array;
import std.conv;

import tools;
int testNumber;

bool isRandomGenerator(T)(T generator) {
  testNumber++;

  auto sample = generator.take(10000).array;

  sample.toCsv("test" ~ testNumber.to!string ~ ".csv");
  sample.toHistCsv("hist" ~ testNumber.to!string ~ ".csv", 0.01);

  //writeln("sample: ", sample);
  throw new Exception("Not implemented.");
}
