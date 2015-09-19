module tools;

version = advanced;

import std.stdio;
import std.conv;

/**
  Save a range to a csv file.

  Example:
    sample.toCsv("test.csv");
*/
void toCsv(T)(T sample, string filename) {
  auto f = File(filename, "w");

  foreach(nr; sample)
    f.writeln(nr);
}

/**
  Create a histogram from a range

  Example:
    sample.toHist(0.1);
*/
auto toHist(T)(T sample, double step) {
  double size = 1 / step;

  long[] hist;

  foreach(i; 0..size + 1) {
    hist ~= [ 0 ];
  }

  foreach(nr; sample) {
    size_t pos = std.math.trunc(nr * size).to!size_t;
    hist[pos]++;
  }

  return hist;
}

/**
  Create a histogram from a range and saves it to a csv file

  Example:
    sample.toHistCsv("test.csv", 0.1);
*/
void toHistCsv(T)(T sample, string filename, double step) {
  auto f = File(filename, "w");

  auto hist = sample.toHist(step);

  foreach(key, val; hist)
    f.writeln(key * step, ",", val);
}
