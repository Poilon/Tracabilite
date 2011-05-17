#include <stdio.h>

int cpt2 = 0;

struct record_msg_basic 
{
  int field_1;
  int field_2;
};

void transmit_record (int msg_in, struct record_msg_basic* msg_out) 
{
  cpt2++;
  int i = (msg_in + cpt2) % 5;
  printf("%d [C] Receive: %d. Transmitted : %d\n", getpid(), msg_in, i);
  msg_out->field_1 = msg_in;
  msg_out->field_2 = i;
}

void receive_record (struct record_msg_basic* msg_in) 
{
  printf("%d [C] Received: (%d, %d)\n", 
	 getpid(),
	 msg_in->field_1, 
	 msg_in->field_2);
}
