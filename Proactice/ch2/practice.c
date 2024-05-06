#include <assert.h>
#include <limits.h>

// 2.13
int bis(int x, int m) { return x | m; }

int bic(int x, int m) { return x & ~m; }

/*
 * x|y
 */
int bool_or(int x, int y) { return bis(x, y); }

/*
 * x^y
 */
int bool_xor(int x, int y) { return bis(bic(x, y), bic(y, x)); }

// 2.27
int uadd_okay(unsigned x, unsigned y) {
  int sum = x + y;
  return sum >= x;
}

// 2.30
int tadd_okay(int x, int y) {
  int sum = x + y;
  int neg_over = x < 0 && y < 0 && sum >= 0;
  int pos_over = x > 0 && y > 0 && sum <= 0;
  return !neg_over && !pos_over;
}

// 2.32
int tsub_okay(int x, int y) {
  //  INT_MIN == -INT_MIN
  if (y == INT_MIN) {
    if (x > 0) {
      return 0;
    }
    if (x <= 0) {
      return 1;
    }
  }
  return tadd_okay(x, -y);
}

int main(int argc, char *argv[]) {
  int a = 0x8f2318ab;
  int b = 0x42f9acda;

  assert(bool_or(a, b) == (a | b));
  assert(bool_xor(a, b) == (a ^ b));

  assert(tadd_okay(100, 200) == 1);
  assert(tadd_okay(INT_MAX, 200) == 0);
  assert(tadd_okay(-100, INT_MAX) == 1);
  assert(tadd_okay(INT_MAX, 200) == 0);

  assert(tsub_okay(INT_MAX, 200) == 1);
  assert(tsub_okay(INT_MIN, 200) == 0);
  assert(tsub_okay(INT_MIN, -200) == 1);
  assert(tsub_okay(-200, INT_MIN) == 1);
}
