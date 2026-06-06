volatile int result;

int main()
{
    int i;
    int sum = 0;

    for(i=1;i<=10;i++)
    {
        sum += i;
    }

    result = sum;

    while(1);

    return 0;
}

// Expected result = 55