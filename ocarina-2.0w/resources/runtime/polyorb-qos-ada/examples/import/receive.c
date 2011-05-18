#include <stdio.h>

int cpt = 0;

void void_proc () 
{
  printf("%d [C] This is the void procedure\n", getpid());
}

void receive (int msg_in) 
{
  printf("%d [C] Received: %d\n", getpid(), msg_in);
}

void transmit (int msg_in, int* msg_out) 
{
  cpt++;
  int i = (msg_in + cpt) % 5;
  printf("%d [C] Received: %d. Transmitted : %d\n", getpid(), msg_in, i);
  *msg_out = i;
}
