#include <stdio.h>
#include <string.h>
// SOLUTION FILE

main()
{
  short int var_short_int;
  unsigned short int var_un_short_int;
  int var_int;   
  unsigned int var_un_int;                
  char var_char;
  unsigned char var_un_char;
  float var_float;
  double var_double;
  long int var_long;
  unsigned long int var_un_long_int;
  long double var_long_double; // 2

  unsigned char uchar1, uchar2;   // 3
  signed char schar1, schar2;

  int x, y;     
  int z;                  // 4

  char i;                         // 5
  char shift_char;

  int a[10] = {0,10,20,30,40,50,60,70,80,90};    // 6

  int b[10], c[10];               // 7
  int *ip, *ip2;
  int j, k;

  char AString[] = "HAL";           // 8

  // 1 -- change "World" to your name
  printf("\n\n PART 1 ---------\n");

  printf("\n Hello Pree Simphliphan (U01702082)! \n");

  // 2 -- find sizes of the other C datatypes
  printf("\n\n PART 2 ----------\n");

  printf("\n size of data type short int = %d ", sizeof(var_short_int));

  printf("\n size of data type unsigned short int = %d ", sizeof(var_un_short_int));
  
  printf("\n size of data type int = %d ", sizeof(var_int));

  printf("\n size of data type unsigned int = %d ", sizeof(var_un_short_int));

  printf("\n size of data type char = %d ", sizeof(var_char));

  printf("\n size of data type unsigned char = %d ", sizeof(var_un_char));

  printf("\n size of data type float = %d ", sizeof(var_float));

  printf("\n size of data type double = %d ", sizeof(var_double));

  printf("\n size of data type long = %d ", sizeof(var_long));

  printf("\n size of data type unsigned long int = %d ", sizeof(var_un_long_int));

  printf("\n size of data type long double = %d ", sizeof(var_long_double));

  // 3 -- explore signed versus unsigned datatypes and their interactions
  printf("\n\n PART 3 ----------\n");

  uchar1 = 0xFF;
  uchar2 = 0xFE;
  schar1 = 0xFF;
  schar2 = 0xFE;

  printf("\n uchar1 = %d ", uchar1);
  printf("\n schar1 = %d ", schar1);

  if (uchar1 < uchar2){
    printf("\n uchar1 is smaller and it is %d",uchar1);
  }
  else {
    if (uchar1 > uchar2){
       printf("\n uchar2 is smaller and it is %d",uchar2);
}
}

if (schar1 < schar2){
    printf("\n schar1 is smaller and it is %d",schar1);
  }
  else {
    if (schar1 > schar2){
       printf("\n schar2 is smaller and it is %d",schar2);
}
}

 printf("\n addition schar1 and uchar1 = %d",schar1+uchar1);
 printf("\n multiplication of schar2 and uchar2 = %d",schar2*uchar2);
 printf("\n multiplication of schar2 and uchar2 with percent u = %u",schar2*uchar2); 

 printf("\n subtraction of schar1 from schar 2 is %d",schar2-schar1);
 printf("\n subtraction of uchar1 from uchar 2 is %d",uchar2-uchar1);
 printf("\n subtraction of uchar1 from uchar 2 with percent u is %u",uchar2-uchar1);

 printf("\n subtract schar1 from uchar1 = %d",uchar1-schar1);

  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;z = 0;
  printf("\n value of True bool = %d",x||z);

  printf("\n value of False bool = %d",x&&z);

  printf("\n size of boolean = %d ",sizeof(x&&y));

    printf("\n 1||2 gives %d",x||y);
    printf("\n while 1|2 gives %d",x|y);

  if(~y){
    printf("\n ~2 gives True");
  }else{
    printf("\n ~2 gives False");
  }

  if(!y){
    printf("\n !2 gives True");
  }else{
    printf("\n !2 gives False");
  }


  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");

  shift_char = 15;
  i = 1;

  printf("\n shift_char << %d = %d", i, shift_char << i);

  printf("\n shift_char >> %d = %d", i, shift_char >> i);

  i = 4;
  printf("\n shift_char >> %d = %d", i, shift_char >> i);

  i = 8;
  printf("\n shift_char >> %d = %d", i, shift_char >> i);

  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = a; 
   printf("\n %d \n",a[0]);
   printf("\n %d \n",*ip);
   printf("\n %d \n",*(ip+1));
   printf("\n %d \n",*ip++);
   printf("\n %d \n",*ip);
   printf("\n %d \n",*(ip+3));
   printf("\n %d \n",*(ip-1));

   printf("\n This is the second part");

   *ip = a[1];
   printf("\n %d \n",a[1]);
   printf("\n %d \n",*ip);
   printf("\n %d \n",*(ip+4)+5);
   printf("\n %d \n",*ip++);
   printf("\n %d \n",*ip);
   printf("\n %d \n",*(ip+3)+5);
   printf("\n %d \n",*(ip+7));

   printf("\n This is the size of the integer pointer = %d",sizeof(ip));
   printf("\n the value of pointer = %x",ip);


  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n");

  for(j=0; j<5;j++){
    b[2*j+1] = a[2*j];
    b[2*j] = a[2*j+1];
}
  ip =&a[0]; ip2 =&c[1];
  for(k=0; k<5; k++){
    *ip2++ = *ip++;
    ip2++;
    ip++;
}
  ip =&a[1]; ip2 =&c[0];
  for(k=0; k<5; k++){
    *ip2++ = *ip++;
    ip2++;
    ip++;
}

  printf("\n this is A");
  for(k=0; k<10; k++){
    printf(" %d ",a[k]);
}
  printf("\n this is B");
  for(k=0; k<10; k++){
    printf(" %d ",b[k]);
}
  printf("\n this is C");
  for(k=0; k<10; k++){
    printf(" %d ",c[k]);
}

  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  printf("\n %s \n", AString);

  printf("\n this is its ASCII by each character");
  for(k=0;k<strlen(AString);k++){
    printf("\n %d",AString[k]);
    printf("\n this is its ASCII in hexadecimal %x",AString[k]);
  }

  for(k=0; k<strlen(AString); k++){
    AString[k]=AString[k]+2;
  }
  printf("\n this is output after add 2 = %s",AString);

  for(k=0; k<strlen(AString); k++){
    AString[k]=AString[k]+32;
  }
  printf("\n this is output after add convert to lower case = %s",AString);
  printf("\n the integer that need to be added is 32");

  // 9 -- address calculation
  printf("\n\n PART 9 ----------\n");
  printf("\n This is address for array b");
  for (k = 0; k < 10; k++){
  b[k] = a[k];         // direct reference to array element
  printf("\n %d",&b[k]);
  }

  ip = a;
  ip2 = b;
  printf("\n This is address for ip2 which is pointed to b");
  for (k = 0; k < 10; k++) {
  printf("\n %d", ip2);
  *ip2++ = *ip++;     // indirect reference to array element
  }
  // all done
  printf("\n\n ALL DONE\n");
}
