# D programming language #

## About
D is a language with C-like syntax and static typing. It pragmatically combines
efficiency, control, and modeling power, with safety and programmer productivity.

## Conditions
### if
```
if (a > b) {
  return "a > b";
} else if ( a < b ) {
  return "a < b";
} else {
  return "a == b";
}
```
### switch
```
switch(value) {
  case 1: writeln(1, "st"); break
  case 2: writeln(2, "nd"); break;
  case 3: writeln(3, "rd"); break;
  default: writeln(value, "th"); break;
}
```
## Iteration
### for
```
for(auto i = 0; i<=10; i++) {
  writeln(i);
}
```
### foreach
```
foreach(i; 0..10) {
  writeln(i);
}
```
```
foreach(item; list) {
  writeln(item);
}
```
```
foreach(index, item; list) {
  writeln(index, item);
}
```
### while
```
while(somethingIsTrue) {
  doSomethingElse();
}
```
