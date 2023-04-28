#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>

#define chars 5
#define size 5

int randy(char aa[size][size])
{
	int i=0, j=0, k=0;

	for(i=0; i<size; i++)
	{
		for(j=0; j<=size; j++)
		{
			if (!k)
			{
				srand(time(NULL));			
			}

		aa[i][j]= ('A' + (rand() % chars));			
		k++;			
		}
	}
	return k;
}
int randy1(int option)
{	
	if (!option)
	{
		srand(time(NULL));			
	}						
	
	return 'A' + (rand() % chars);
}
int asd(int sco)
{
	system("cls");
	printf("<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>\n");
	printf("<>\t\t\tYour score:\t%d\t\t\t<>\n", sco);
	printf("<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>\n");

	return sco;
}

char board(char arr[size][size], int sco)
{
	int i=0,j=0;

	system("cls");
	asd(sco);
	for(i=0; i<size; i++)
	{
		for(j=0; j<size+1; j++)
		{
		if(j==size)
		printf("\n\n");				
		else
		printf("\t%c", arr[i][j]);
		}
	}
	return sco;
}
char hint(char arr[size][size], int sco)
{
	int i=0, j=0, a=0, b=0;

	for(i=0;i<size;i++)
	{
		for(j=0; j<size-2; j++)
		{
		if((arr[i][j]==arr[i][j+1])&&(arr[i][j]==arr[i][j+2]))
			{
			system("cls");
asd(sco);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if(((a==i)&&(b==j))||((a==i)&&(b==j+1))||((a==i)&&(b==j+2)))
					printf("\033[33m\t%c\033[0m", arr[a][b]);
					else
					printf("\t%c", arr[a][b]);
					}
				}return sco;
			}
		}
	}
	for(j=0;j<size;j++)
	{
		for(i=0; i<size-2; i++)
		{
		if((arr[i][j]==arr[i+1][j])&&(arr[i][j]==arr[i+2][j]))
			{
			system("cls");
asd(sco);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if(((a==i)&&(b==j))||((a==i+1)&&(b==j))||((a==i+2)&&(b==j)))
					printf("\033[33m\t%c\033[0m", arr[a][b]);
					else
					printf("\t%c", arr[a][b]);
					}
				}return sco;
			}
		}
	}
	for(i=2;i<size;i++)
	{
		for(j=0; j<size-2; j++)
		{
		if((arr[i][j]==arr[i-1][j+1])&&(arr[i][j]==arr[i-2][j+2]))
			{
			system("cls");
asd(sco);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if(((a==i)&&(b==j))||((a==i-1)&&(b==j+1))||((a==i-2)&&(b==j+2)))
					printf("\033[33m\t%c\033[0m", arr[a][b]);
					else
					printf("\t%c", arr[a][b]);
					}
				}return sco;
			}
		}
	}
	for(i=0;i<size-2;i++)
	{
		for(j=0; j<size-2; j++)
		{
		if((arr[i][j]==arr[i+1][j+1])&&(arr[i][j]==arr[i+2][j+2]))
			{
			system("cls");
asd(sco);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if(((a==i)&&(b==j))||((a==i+1)&&(b==j+1))||((a==i+2)&&(b==j+2)))
					printf("\033[33m\t%c\033[0m", arr[a][b]);
					else
					printf("\t%c", arr[a][b]);
					}
				}return sco;
			}
		}
	}
	return sco;
}
int finder(char ar[size][size], char let1, int num1, int sco, int find)
{
	int i=0, j=0, k=0, counter=0, a=0, b=0, z=0, y=0, pa=0, pb=0, x=0, w=0, xy=1, yx=0;

	for(i=0;i<size;i++)
	{
		for(j=0; j<size; j++)
		{
			for(k=0; k<num1; k++)
			{
			if((let1==ar[i][j+k])&&((j+k)<size))
				{
				z=j+k;
				counter++;
				}
			}
		if(counter==num1)
			{
			system("cls");
			asd(sco);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if((a==i)&&(b>=(z-k))&&(b<=z)&&(ar[a][b]==let1))
					printf("\033[31m\t%c\033[0m", ar[a][b]);
					else
					printf("\t%c", ar[a][b]);
					}
				}
sleep(1);
system("cls");
asd(sco);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if((a==i)&&(b>=(z-k))&&(b<=z)&&(ar[a][b]==let1))
					{
					ar[a][b]=' ';
					printf("\t%c", ar[a][b]);
					}
					else
					printf("\t%c", ar[a][b]);
					}
				}
				for(a=size-1; a>=0; a--)
				{
					for(b=size-1; b>=0; b--)
					{
					if(ar[a][b]==' ')	
					{
					w=b;
					for(x=a;x>=0;x--)
						{
						if(x==0)
						ar[x][w]=randy1(k);
						else
						ar[x][w]=ar[(x-1)][w];
						}

					}

					}
				}
				sleep(1);system("cls");asd(sco);for(a=0;a<size;a++){for(b=0;b<=size;b++){if(b==size)printf("\n\n");else printf("\t%c", ar[a][b]);}}

				find++;return find;
			}
		else
		counter=0;
		}
	}
	for(j=0; j<size; j++)
	{counter=0;
		for(i=0; i<size; i++)
		{
			for(k=0; k<num1; k++)
			{
			if((let1==ar[i+k][j])&&((i+k)<size))
				{
				z=i+k;
				counter++;
				}
			}
		if(counter==num1)
			{
			system("cls");

			asd(sco);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if((b==j)&&(a>=(z-k)&&(a<=z))&&(ar[a][b]==let1))
					printf("\033[31m\t%c\033[0m", ar[a][b]);
					else
					printf("\t%c", ar[a][b]);
					}
				}
sleep(1);
system("cls");
asd(sco);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if((b==j)&&(a>=(z-k)&&(a<=z))&&(ar[a][b]==let1))
					{
					ar[a][b]=' ';
					printf("\t%c", ar[a][b]);
					}
					else
					printf("\t%c", ar[a][b]);
					}
				}
				do{
				for(a=size-1; a>=0; a--)
				{
					for(b=size-1; b>=0; b--)
					{
					if(ar[a][b]==' ')	
					{
					w=b;
					for(x=a;x>=0;x--)
						{
						if(x==0)
						ar[x][w]=randy1(k);
						else
						ar[x][w]=ar[(x-1)][w];
						}

					}

					}
				}xy++;
					}while (xy<=size);



				sleep(1);system("cls");asd(sco);for(a=0;a<size;a++){for(b=0;b<=size;b++){if(b==size)printf("\n\n");else printf("\t%c", ar[a][b]);}}

find++;
return find;
			}
		else
		counter=0;
		}
	}
	for(i=0;i<size;i++)
	{counter=0;
		for(j=0; j<size; j++)
		{
			for(k=0; k<num1; k++)
			{
			if((let1==ar[i+k][j+k])&&(((j+k)<size)&&((i+k)<size)))
				{
				y=i+k;
				z=j+k;
				counter++;
				}
			}
		if(counter==num1)
			{
			system("cls");
			asd(sco);
			pa=y-(k-1);
			pb=z-(k-1);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if((num1>=yx)&&(pa==a)&&(pb==b)&&(ar[a][b])==let1)
					{printf("\033[31m\t%c\033[0m", ar[a][b]);pa=a+1;pb=b+1;yx++;}
					else
					printf("\t%c", ar[a][b]);
					}
				}
sleep(1);
system("cls");
asd(sco);
pa=y-(k-1);
pb=z-(k-1);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if((num1>=yx)&&(pa==a)&&(pb==b)&&(ar[a][b])==let1)
					{
					ar[a][b]=' ';
					printf("\t%c", ar[a][b]);pa=a+1;pb=b+1;
					}
					else
					printf("\t%c", ar[a][b]);
					}
				}
				for(a=size-1; a>=0; a--)
				{
					for(b=size-1; b>=0; b--)
					{
					if(ar[a][b]==' ')	
					{
					w=b;
					for(x=a;x>=0;x--)
						{
						if(x==0)
						ar[x][w]=randy1(k);
						else
						ar[x][w]=ar[(x-1)][w];
						}

					}

					}
				}
				sleep(1);system("cls");asd(sco);for(a=0;a<size;a++){for(b=0;b<=size;b++){if(b==size)printf("\n\n");else printf("\t%c", ar[a][b]);}}
find++;return find;
			}
		else
		counter=0;
		}
	}
	for(i=0;i<size;i++)
	{counter=0;
		for(j=size-1; j>=0; j--)
		{
			for(k=0; k<num1; k++)
			{
			if((let1==ar[i+k][j-k])&&(((j-k)>=0)&&((i+k)<size)))
				{
				y=i+k;
				z=j-k;
				counter++;
				}
			}
		if(counter==num1)
			{
			system("cls");
			asd(sco);
			pa=y-(k-1);
			pb=z+(k-1);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if((num1>=yx)&&(pa==a)&&(pb==b)&&(ar[a][b]==let1))
					{
					{printf("\033[31m\t%c\033[0m", ar[a][b]);pa=a+1;pb=b-1;}
					}
					else
					printf("\t%c", ar[a][b]);
					}
				}
sleep(1);
system("cls");
asd(sco);
pa=y-(k-1);
pb=z+(k-1);
				for(a=0; a<size; a++)
				{
					for(b=0; b<size+1; b++)
					{
					if(b==size)
					printf("\n\n");
					else if((num1>=yx)&&(pa==a)&&(pb==b)&&(ar[a][b]==let1))
					{
					ar[a][b]=' ';
					printf("\t%c", ar[a][b]);pa=a+1;pb=b-1;}
					else
					printf("\t%c", ar[a][b]);
					}
				}
				for(a=size-1; a>=0; a--)
				{
					for(b=size-1; b>=0; b--)
					{
					if(ar[a][b]==' ')	
					{
					w=b;
					for(x=a;x>=0;x--)
						{
						if(x==0)
						ar[x][w]=randy1(k);
						else
						ar[x][w]=ar[(x-1)][w];
						}

					}

					}
				}
				sleep(1);system("cls");asd(sco);for(a=0;a<size;a++){for(b=0;b<=size;b++){if(b==size)printf("\n\n");else printf("\t%c", ar[a][b]);}}
find++;return find;
			}
		else
		counter=0;
		}
	}
return 0;
}
int main()
{
	char array[size][size], answer[30], ans[30];
	int i, j=0, score=0, count=0, life=3, num, fin=0;
	char let;


	randy(array);
do
{	
	do
	{
	board(array, score);
	for(i=0;i<size;i++)
	{
		for(j=0; j<size-2; j++)
		{
		if((array[i][j]==array[i][j+1])&&(array[i][j]==array[i][j+2]))
		count++;
		}
	}
	for(j=0;j<size;j++)
	{
		for(i=0; i<size-2; i++)
		{
		if((array[i][j]==array[i+1][j])&&(array[i][j]==array[i+2][j]))
		count++;
		}
	}
	for(i=2;i<size;i++)
	{
		for(j=0; j<size-2; j++)
		{
		if((array[i][j]==array[i-1][j+1])&&(array[i][j]==array[i-2][j+2]))
		count++;
		}
	}
	for(i=0;i<size-2;i++)
	{
		for(j=0; j<size-2; j++)
		{
		if((array[i][j]==array[i+1][j+1])&&(array[i][j]==array[i+2][j+2]))
		count++;
		}
	}

	if(count==0)
	{
	printf("\nNo patterns found.\nResetting..\n");
	sleep(2);
	randy(array);
	}

	}while(count==0);


	j=0;
	do
	{
		fgets(answer, 30, stdin);
		for(i=0; i<30; i++)
		{
			if((answer[i] != ' ')&&(answer[i] != '\n'))			
			{
			ans[j]=answer[i];
			j++;
			}
		}
		j=0;
	
		if((isdigit(ans[0]))&&(isalpha(ans[1])))
			{
			num = ans[0] - '0';
			let = toupper(ans[1]);
			if((num<=size)&&(num>2))
				{
				finder(array, let, num, score, fin);
				if(fin==0){
				life=3;
				count=0; score=score+(num/2); fin=0;
				break;
				}
				else
				{
				printf("Pattern not found\n");
				life--;
				if(life>0)
					{
					printf("%d try(ies) left\n", life);
					sleep(1);
					board(array, score);
					}
				else
					{
					printf("\nNo tries left.\nGame Over!\nYour score : %d\n", score);
					exit(0);
					}
				}
				}
			else
				{
				printf("Your input is invalid.\nTry Again.\n");
				life--;
				if(life>0)
					{
					printf("%d try(ies) left\n", life);
					sleep(1);
					board(array, score);
					}
				else
					{
					printf("\nNo tries left.\nGame Over!\nYour score : %d\n", score);
					exit(0);
					}
				}
			}
		else if (strcasecmp(ans, "hint")==0)
		{
		hint(array, score);
		}
		else if (strcasecmp(ans, "exit")==0)
		{
		printf("\nGame Over!\nYour score : %d\n", score);
		exit(0);
		}
		else
		{
		printf("Your input is invalid.\nTry Again.\n");
		life--;
		if(life>0)
		{
		printf("%d try(ies) lefts\n", life);
		sleep(1);
		board(array, score);
		}
		else
		{
		printf("\nNo tries left.\nGame Over!\nYour score : %d\n", score);
		exit(0);
		}

		}

	}while(strcasecmp(ans, "exit")!=0);
}while(strcasecmp(ans, "exit")!=0);

	return 0;
}
