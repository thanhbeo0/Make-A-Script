#include <stdio.h>
#include <stdint.h>

static inline uint64_t getcntvct()
{
  uint64_t vct;
  __asm__ volatile(
  "mrs %0, cntvct_el0": "=r" (vct)
  );
  return vct;
}

static inline uint64_t getcntfrq()
{
  uint64_t frq;
  __asm__ volatile(
  "mrs %0, cntfrq_el0": "=r" (frq)
  );
  return frq;
}

int main(void){
  uint64_t frq = getcntfrq(); // get frq
  uint64_t start = getcntvct(); // get vct, set starting point
  uint64_t sleep = 2500; // Sleep time
  while((double)(getcntvct()-start)/frq<(double)sleep/1000); //Sleep while
  printf("Sleep: %f\n", (double)(getcntvct()-start)/frq);
  return 0;
}
