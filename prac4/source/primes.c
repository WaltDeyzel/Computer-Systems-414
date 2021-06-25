#include <stdio.h>

int main() 
{
    int i, num = 1, primes = 0;
	int p_max = 50000;
	
	printf("Calculating primes in first %d numbers.\n",p_max);
	fflush(stdout);
	
    while (num <= p_max)
    { 
        i = 2; 
        while (i <= num)
        { 
            if(num % i == 0)
                break;
            i++; 
        }
        if (i == num)
        {   
			primes++;
			printf("%d\n",num);
		}
        num++;
    }
	printf("%d primes found.\n",primes);
	return 0;
}
