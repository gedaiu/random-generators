module tools;

import std.stdio;
import std.conv;

void toCsv(T)(T sample, string filename) {
  auto f = File(filename, "w");

  foreach(nr; sample)
    f.writeln(nr);
}

void toHistCsv(T)(T sample, string filename, double step) {
  double size = 1 / step;

  ulong[] hist;

  foreach(i; 0..size) {
    hist ~= [ 0 ];
  }

  foreach(nr; sample) {
    long pos = std.math.trunc(nr * size).to!long;
    hist[pos]++;
  }

  auto f = File(filename, "w");

  foreach(key, val; hist)
    f.writeln((key+1) * step, ",", val);
}
