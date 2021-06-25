#include <stdio.h>

#define MAX_PRIME 200000

int main() 
{
    int i,j;
	int num = 0;
	int primes[MAX_PRIME];
	
	printf("Sieving primes to %d.\n",MAX_PRIME);
	fflush(stdout);
	
	for (i=0; i<MAX_PRIME; i++)
	{
		primes[i] = 1;
	}

	for (i=2; i<MAX_PRIME; i++)
	{
		j = i;
		if (primes[j] == 1)
		{
			printf("%d\n",j);
			j += i;
			num++;
			while (j < MAX_PRIME)
			{
				primes[j] = 0;
				j += i;
			}
		}
	}
	printf("%d primes found.\n",num);
	return 0;
}
