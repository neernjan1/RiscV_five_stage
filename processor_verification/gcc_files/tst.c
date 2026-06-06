// ============================================================
// TEST 1 : Fibonacci Sequence Test
// Purpose:
// - Loops
// - RAW hazards
// - Branches
// - Arithmetic datapath
//
// Expected Result = 55
// ============================================================

int main()
{
    int n = 10;
    int a = 0, b = 1, c = 0;

    for(int i = 0; i <= n; i++)
    {
        c = a;
        a = b;
        b = c + b;
    }

    return c;
}


// ============================================================
// TEST 2 : Bubble Sort Test
// Purpose:
// - Nested loops
// - Array accesses
// - Loads / Stores
// - Branch hazards
//
// Expected Result = 1
// ============================================================

// volatile int arr[8] = {8,7,6,5,4,3,2,1};
// volatile int result;

// int main()
// {
//     int i,j,temp;

//     for(i=0;i<8;i++)
//     {
//         for(j=0;j<7-i;j++)
//         {
//             if(arr[j] > arr[j+1])
//             {
//                 temp = arr[j];
//                 arr[j] = arr[j+1];
//                 arr[j+1] = temp;
//             }
//         }
//     }

//     result = arr[0];

//     while(1);
// }


// ============================================================
// TEST 3 : ALU Comprehensive Test
// Purpose:
// - ADD
// - SUB
// - XOR
// - AND
// - OR
// - Immediate operations
// - Memory access
// - Branches
//
// Expected Result = 110
// ============================================================

// volatile int result;

// int main()
// {
//     int a = 10;
//     int b = 5;
//     int c;

//     c = a + b;
//     c = c - 3;

//     c = c ^ 2;
//     c = c & 7;
//     c = c | 8;

//     c = c + 1;

//     volatile int mem[4];

//     mem[0] = c;
//     mem[1] = mem[0] + 5;

//     if(mem[1] == 20)
//         c = 100;
//     else
//         c = -1;

//     int sum = 0;

//     for(int i=0;i<5;i++)
//         sum += i;

//     result = c + sum;

//     return result;
// }


// ============================================================
// TEST 4 : Signed Arithmetic + Branch Test
// Purpose:
// - Signed comparisons
// - Negative numbers
// - Branch instructions
//
// Expected Result = 6
// ============================================================

// volatile int result;

// int main()
// {
//     int a = -5;
//     int b = 3;
//     int sum = 0;

//     for(int i=-3;i<3;i++)
//     {
//         if(i < 0)
//             sum += a;
//         else
//             sum += b;
//     }

//     if(sum < 0)
//         sum = -sum;

//     result = sum;

//     return result;
// }


// ============================================================
// TEST 5 : Simple Addition Test
// Purpose:
// - Basic ALU verification
//
// Expected Result = 30
// ============================================================

// volatile int result;

// int main()
// {
//     int a = 10;
//     int b = 20;

//     result = a + b;

//     while(1);
// }


// ============================================================
// TEST 6 : Memory Store Test
// Purpose:
// - Store instructions
// - Data memory verification
// ============================================================

// volatile int arr[4];

// int main()
// {
//     arr[0] = 10;
//     arr[1] = 20;
//     arr[2] = 30;
//     arr[3] = 40;

//     while(1);
// }


// ============================================================
// TEST 7 : Constant Arithmetic Test
// Purpose:
// - Immediate arithmetic
//
// Expected Result = 40
// ============================================================

// volatile int result;

// int main()
// {
//     result = 15 + 25;

//     while(1);
// }


// ============================================================
// TEST 8 : Branch Decision Test
// Purpose:
// - BLT verification
//
// Expected Result = 111
// ============================================================

// volatile int result;

// int main()
// {
//     int a = 10;
//     int b = 20;

//     if(a < b)
//         result = 111;
//     else
//         result = 222;

//     while(1);
// }


// ============================================================
// TEST 9 : RAW Dependency Chain Test
// Purpose:
// - RAW hazards
// - Forwarding logic
//
// Expected Result = 9
// ============================================================

// volatile int result;

// int main()
// {
//     int a = 5;

//     a = a + 1;
//     a = a + 1;
//     a = a + 1;
//     a = a + 1;

//     result = a;

//     while(1);
// }


// ============================================================
// TEST 10 : Factorial Test
// Purpose:
// - Nested loops
// - Arithmetic stress
//
// Expected Result = 720
// ============================================================

// volatile int result;

// int main()
// {
//     int n = 6;
//     int fact = 1;

//     for(int i=1;i<=n;i++)
//     {
//         int temp = 0;

//         for(int j=0;j<i;j++)
//             temp += fact;

//         fact = temp;
//     }

//     result = fact;

//     while(1);
// }


// ============================================================
// TEST 11 : Load-Use Hazard Test
// Purpose:
// - LW followed immediately by dependent instruction
// - Stall verification
//
// Expected Result = 105
// ============================================================

// volatile int mem = 100;
// volatile int result;

// int main()
// {
//     int a,b;

//     a = mem;
//     b = a + 5;

//     result = b;

//     while(1);
// }


// ============================================================
// TEST 12 : RAW Hazard Stress Test
// Purpose:
// - Multiple dependent instructions
// - Forwarding verification
//
// Expected Result = 22
// ============================================================

// volatile int result;

// int main()
// {
//     volatile int a = 1;

//     a = a + 1;
//     a = a + 2;
//     a = a + 3;
//     a = a + 4;
//     a = a + 5;
//     a = a + 6;

//     result = a;

//     while(1);
// }


// ============================================================
// TEST 13 : Forwarding Test
// Purpose:
// - EX→EX forwarding
// - MEM→EX forwarding
//
// Expected Result = 20
// ============================================================

// volatile int result;

// int main()
// {
//     volatile int a = 10;
//     volatile int b;

//     b = a + 5;
//     a = b + 3;
//     b = a + 2;

//     result = b;

//     while(1);
// }


// ============================================================
// TEST 14 : Load-Use + RAW + Branch Hazard Test
// Purpose:
// - Load hazard
// - RAW hazard
// - Branch hazard
//
// Expected Result = 1
// ============================================================

// volatile int mem = 100;
// volatile int result;

// int main()
// {
//     volatile int a,b,c,d,e;

//     a = mem;
//     b = a + 1;
//     c = b + 2;
//     d = c + 3;
//     e = d + 4;

//     if(e == 110)
//         result = 1;
//     else
//         result = 0;

//     while(1);
// }


// ============================================================
// TEST 15 : Multiple Load/Store Verification
// Purpose:
// - Multiple loads
// - Multiple stores
// - Data path validation
//
// Expected Result = 30
// ============================================================

// volatile int a = 10;
// volatile int b = 20;
// volatile int result;

// int main()
// {
//     volatile int x,y,z;

//     x = a;
//     y = b;

//     z = x + y;

//     result = z;

//     while(1);
// }


// ============================================================
// TEST 16 : Full Pipeline Hazard Test
// Purpose:
// - Load hazard
// - RAW hazard
// - Branch hazard
// - Store hazard
//
// Expected Result = 115
// ============================================================

// volatile int mem = 100;
// volatile int result;

// int main()
// {
//     volatile int a,b,c,d,e,f;

//     a = mem;
//     b = a + 1;
//     c = b + 2;
//     d = c + 3;
//     e = d + 4;

//     if(e == 110)
//         f = e + 5;
//     else
//         f = 0;

//     result = f;

//     while(1);
// }


// ============================================================
// TEST 17 : Prime Number Detection Test
// Purpose:
// - Branch-heavy workload
// - Nested loops
// - Arithmetic stress
//
// Expected Result = 0
// (60 is not prime)
// ============================================================

// volatile int result;

// int main()
// {
//     volatile int n = 60;
//     volatile int i;

//     result = 1;

//     for(i=2;i<n;i++)
//     {
//         int temp = n;

//         while(temp >= i)
//             temp = temp - i;

//         if(temp == 0)
//         {
//             result = 0;
//             break;
//         }
//     }

//     while(1);
// }


// ============================================================
// TEST 18 : Complex Dependency Chain Test
// Purpose:
// - Multiple RAW hazards
// - Forwarding stress
// - Branch verification
//
// Expected Result = 1
// ============================================================

// volatile int A = 10;
// volatile int B = 20;
// volatile int C = 30;
// volatile int result;

// int main()
// {
//     volatile int x,y,z;

//     x = A;
//     y = B;
//     z = C;

//     x = x + y;
//     y = x + z;
//     z = y + x;

//     if(z == 90)
//         result = 1;
//     else
//         result = 0;

//     while(1);
// }


// ============================================================
// TEST 19 : Bubble Sort Stress Test
// Purpose:
// - Loads
// - Stores
// - Branches
// - Nested loops
//
// Expected Result = 1
// ============================================================

// volatile int arr[8] = {6,1,8,5,2,4,3,7};
// volatile int result;

// int main()
// {
//     int i,j,temp;

//     for(i=0;i<8;i++)
//     {
//         for(j=0;j<7-i;j++)
//         {
//             if(arr[j] > arr[j+1])
//             {
//                 temp = arr[j];
//                 arr[j] = arr[j+1];
//                 arr[j+1] = temp;
//             }
//         }
//     }

//     result = arr[0];

//     while(1);
// }