module tools;

import std.stdio;
import std.conv;

void toCsv(T)(T sample, string filename) {
  auto f = File(filename, "w");

  foreach(nr; sample)
    f.writeln(nr);
}

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

void toHistCsv(T)(T sample, string filename, double step) {
  auto f = File(filename, "w");

  auto hist = sample.toHist(step);

  foreach(key, val; hist)
    f.writeln(key * step, ",", val);
}
