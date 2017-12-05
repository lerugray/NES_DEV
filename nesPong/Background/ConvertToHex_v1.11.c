#include <stdio.h>

int main(int argc, char *argv[])
{
	char c;
	int count = 0;
	FILE* inFile = fopen(argv[1],"rb");


	char outFilename[ FILENAME_MAX ];
	sprintf(outFilename, "%s.asm", argv[1]);
	FILE* outFile = fopen(outFilename,"w");


	if(inFile==NULL)
	{
		printf("File Not Found\n");
		return 0;
	}
	else
	{
		c = fgetc(inFile);
		while(c!=EOF)
		{
			if(count % 16 == 0)
			{
				fprintf(outFile,"\n\t.db ");
			}
			else
			{
				fprintf(outFile,",");
			}
			fprintf(outFile,"$%02X",(unsigned char)c);
			count++;
			c = fgetc(inFile);
		}

		fclose(inFile);
		fclose(outFile);
		return 1;
	}
}
