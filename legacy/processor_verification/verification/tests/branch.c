volatile int result;

int main()
{
    int a = 10;
    int b = 20;

    if(a < b)
        result = 111;
    else
        result = 222;

    while(1);

    return 0;
}

// Expected result = 111 