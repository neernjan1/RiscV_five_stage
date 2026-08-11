// //basic program...
// // __attribute__((noinline))
// // int main(){
// //     volatile unsigned int a = 6;
// //     volatile unsigned int b = 4;
// //     volatile unsigned int c = 0;

// //     for(volatile unsigned int i = 0; i<=3; i++){
// //         c += a+b;
// //     }

// //     return c;
// // }
// //fibonacci sequence ..
// // int main() {
// //     int n = 10;
// //     int a = 0, b = 1, c = 0;

// //     for (int i = 0; i <= n; i++) {
// //         c = a;
// //         a = b;
// //         b = c + b;
// //     }

// //     return c;
// // }
// //basic operations 
// // __attribute__((noinline))
// // int main() {
// //     volatile int a = 10;
// //     volatile int b = 3;

// //     volatile int r1 = a + b;   // 13
// //     volatile int r2 = r1 - b;  // 10
// //     volatile int r3 = r2 & b;  // 2
// //     volatile int r4 = r3 | a;  // 10
// //     volatile int r5 = r4 ^ b;  // 9
// //     volatile int r6 = r5 << 1; // 18
// //     volatile int r7 = r6 >> 1; // 9

// //     return r7;
// // }
// //basic program 2
// // __attribute__((noinline))
// // int main() {
// //     volatile int sum = 0;

// //     for (volatile int i = 0; i < 5; i++) {
// //         if (i % 2 == 0)
// //             sum += 2;
// //         else
// //             sum += 1;
// //     }

// //     return sum;
// // }
// //load store program
// //__attribute__((noinline))
// // int main() {
// //     volatile int mem[4];

// //     mem[0] = 5;
// //     mem[1] = 10;
// //     mem[2] = mem[0] + mem[1];  // 15
// //     mem[3] = mem[2] + 20;      // 35

// //     return mem[3];
// // }
// // __attribute__((noinline))
// // int main() {
// //     volatile int signature = 0;

// //     for (int i = 1; i <= 5; i++) {
// //         signature += i * 3;
// //     }

// //     return signature;  // expected = 45
// // }
// // __attribute__((noinline))
// // int main() {
// //     volatile int arr[16];
// //     volatile int i, sum = 0;
// //     volatile int a = 7, b = 3, c = 1;

// //     // -----------------------------
// //     // Phase 1: Initialize memory
// //     // -----------------------------
// //     for (i = 0; i < 16; i++) {
// //         arr[i] = (i * a) ^ (b + i);   // mix ALU ops
// //     }

// //     // -----------------------------
// //     // Phase 2: Process data
// //     // -----------------------------
// //     for (i = 0; i < 16; i++) {

// //         int val = arr[i];

// //         // Branch-heavy logic
// //         if (val & 1) {
// //             val = val + (a << 1);
// //         } else {
// //             val = val - (b >> 1);
// //         }

// //         // Data dependency chain
// //         c = c + val;
// //         c = c ^ (c << 2);
// //         c = c + (c >> 3);

// //         // Store back
// //         arr[i] = val ^ c;

// //         sum += arr[i];
// //     }

// //     // -----------------------------
// //     // Phase 3: Reduction
// //     // -----------------------------
// //     for (i = 0; i < 16; i++) {
// //         sum ^= arr[i];
// //     }

// //     return sum;
// // }
// // __attribute__((noinline))
// // int main() {
// //      int arr[10];   // store results
// //      int i;
// //      int val = 1;   // 3^0

// //     for (i = 0; i < 10; i++) {
// //         arr[i] = val;       // store current power
// //         val = val * 3;      // next power
// //     }

// //     return arr[9];          // return last value (3^9 = 19683)
// // }
// //fibonacci sequence ..
// // int main() {
// //     int n = 10;
// //     int a = 0, b = 1, c = 0;

// //     for (int i = 0; i <= n; i++) {
// //         c = a;
// //         a = b;
// //         b = c + b;
// //     }

// //     return c;
// // }

// // __attribute__((noinline))
// // int main() {
// //     volatile int arr[10];
// //     volatile int a = 1;

// //     for (volatile int i = 0; i < 10; i++) {
// //         arr[i] = a;
// //         a = a + a + a;
// //     }

// //     return arr[9];
// // // }
// //x10=126
// // #include <stdint.h>

// // volatile int result = 0;

// // int main() {
// //     int a = 10;
// //     int b = 5;
// //     int c;

// //     // Arithmetic
// //     c = a + b;     // 15
// //     c = c - 3;     // 12

// //     // Logical
// //     c = c ^ 2;     // 14
// //     c = c & 7;     // 6
// //     c = c | 8;     // 14

// //     // Immediate
// //     c = c + 1;     // 15

// //     // Memory test
// //     volatile int mem[4];
// //     mem[0] = c;
// //     mem[1] = mem[0] + 5;  // 20

// //     // Branch test
// //     if (mem[1] == 20) {
// //         c = 100;
// //     } else {
// //         c = -1;
// //     }

// //     // Loop (branch + jump)
// //     int sum = 0;
// //     for (int i = 0; i < 5; i++) {
// //         sum += i;   // 0+1+2+3+4 = 10
// //     }

// //     result = c + sum;  // 100 + 10 = 110

// //     return result;
// // }
// //x10=6
// // #include <stdint.h>

// // volatile int result = 0;

// // int main() {
// //     int a = -5;
// //     int b = 3;
// //     int sum = 0;

// //     // Loop with signed condition
// //     for (int i = -3; i < 3; i++) {
// //         if (i < 0) {
// //             sum += a;   // negative accumulation
// //         } else {
// //             sum += b;   // positive accumulation
// //         }
// //     }

// //     // Expected:
// //     // i = -3,-2,-1 → sum += -5 three times = -15
// //     // i = 0,1,2   → sum += 3 three times = +9
// //     // total = -6

// //     // Additional branch check
// //     if (sum < 0) {
// //         sum = sum * -1;   // make positive → 6
// //     }

// //     result = sum;
// //     return result;
// // }
// // //25
// #include <stdint.h>

// volatile int result = 0;

// int main() {
//     volatile uint8_t  b[4];
//     volatile uint16_t h[2];
//     volatile uint32_t w;

//     // Byte pattern
//     b[0] = 0x80;   // -128 if signed
//     b[1] = 0x7F;   // +127
//     b[2] = 0xFF;   // -1
//     b[3] = 0x01;   // +1

//     // Halfword pattern
//     h[0] = 0x8000; // -32768 if signed
//     h[1] = 0x7FFF; // +32767

//     // Word pattern
//     w = 0x80000001;

//     int sum = 0;

//     // BYTE LOAD TEST
//     sum += (int8_t)b[0];   // -128
//     sum += (int8_t)b[1];   // +127
//     sum += (int8_t)b[2];   // -1
//     sum += (int8_t)b[3];   // +1

//     // HALFWORD LOAD TEST
//     sum += (int16_t)h[0];  // -32768
//     sum += (int16_t)h[1];  // +32767

//     // WORD LOAD TEST
//     sum += (int32_t)w;     // 0x80000001 = -2147483647

//     result = sum;

//     return result;
// // }
//UART program 
#include <stdint.h>

#define UART_BASE 0x40001000

#define UART_RBR_THR_DLL (*(volatile uint32_t*)(UART_BASE + 0x00))
#define UART_DLM         (*(volatile uint32_t*)(UART_BASE + 0x04))
#define UART_FCR         (*(volatile uint32_t*)(UART_BASE + 0x08))
#define UART_LCR         (*(volatile uint32_t*)(UART_BASE + 0x0C))

void uart_putc(char c) {

    UART_RBR_THR_DLL = c;

    // TEMP FIX:
    // wait for UART serializer to consume byte

    for (volatile int i = 0; i < 2000; i++);
}

void uart_puts(const char *s) {
    while (*s) {
        uart_putc(*s++);
    }
}

void delay(volatile int d) {
    while (d--);
}

int main() {

    // ================= UART INIT =================

    UART_LCR = 0x80;     // Enable DLAB

    UART_RBR_THR_DLL = 2; // DLL
    UART_DLM         = 0; // DLM

    UART_LCR = 0x03;     // 8-bit mode, disable DLAB

    UART_FCR = 0x01;     // Enable FIFO

    // ================= TEST =================

    // uart_puts("\n====================\n");
    // uart_puts("UART TEST START\n");
    // uart_puts("====================\n");
   delay(10000);
    uart_putc('A');
    //delay(10000);
    uart_putc('B');
   // delay(10000);
    uart_putc('C');
   // delay(10000);
    uart_putc('7');
  //  delay(10000);
//uart_putc('0');

 //    uart_puts("HELLO UART\n");

    // delay(10000);

    // uart_puts("ABCDEFGHIJKLMNOPQRSTUVWXYZ\n");

    // delay(10000);

    // uart_puts("0123456789\n");

    // delay(10000);

    // uart_puts("!@#$%^&*()_+-=\n");

    // delay(10000);

    // for (int i = 0; i < 10; i++) {

    //     uart_puts("PACKET_");

    //     uart_putc('0' + i);

    //     uart_putc('\n');

    //     delay(5000);
    // }

    // uart_puts("====================\n");
    // uart_puts("UART TEST DONE\n");
    // uart_puts("====================\n");

    while (1);

    return 0;
}