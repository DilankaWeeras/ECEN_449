#include <stdio.h>
#include <stdlib.h>

main()
{
    int row1 = 0;
    int col1 = 0;

    int row2 = 0;
    int col2 = 0;
    int i, j, m;

    //Can take inputs up to 100 by 100

    FILE *fptr;

    if ((fptr = fopen("matrix1.txt", "r")) == NULL)
    {
        printf("Error! opening file");
        exit(1);
    }

    fscanf(fptr, "%d", &row1);
    fscanf(fptr, "%d", &col1);

    printf("Value of row1: \n", row1);
    printf("Value of row1: \n", col1);

    double **matrix1 = (int **)malloc(r * sizeof(int *));
    for (i = 0; i < row1; i++)
    {
        matrix1[i] = (int *)malloc(c * sizeof(int));
    }

    for (i = 0; i < row1; i++)
    {
        for (j = 0; j < col1; j++)
        {
            fscanf(fptr, "%d", matrix1[i][j]);
            printf("%d ", matrix1[i][j]);
        }
        printf("\n");
    }
    fclose(fptr);

    if ((fptr = fopen("matrix2.txt", "r")) == NULL)
    {
        printf("Error! opening file");
        exit(1);
    }

    fscanf(fptr, "%d", &row2);
    fscanf(fptr, "%d", &col2);

    printf("Value of row1: ", row2);
    printf("Value of row1: ", col2);

    if (col1 != row2)
    {
        printf("Error! Matrix sizes do not match.");
    }

    double **matrix2 = (int **)malloc(r * sizeof(int *));
    for (i = 0; i < row1; i++)
    {
        matrix2[i] = (int *)malloc(c * sizeof(int));
    }

    int i;
    for (i = 0; i < row1; i++)
    {
        for (j = 0; j < col1; j++)
        {
            fscanf(fptr, "%d", matrix2[i][j]);
            printf("%d ", matrix2[i][j]);
        }
        printf("\n");
    }
    fclose(fptr);

    //will become size row1-col2
    double **matrixM = (int **)malloc(r * sizeof(int *));
    for (i = 0; i < row1; i++)
    {
        matrixM[i] = (int *)malloc(c * sizeof(int));
    }
    for (i = 0; i < row1; i++)
    {
        for (j = 0; j < col2; j++)
        {
            for (m = 0; m < col1; m++)
            {
                matrixM[i][j] = matrixM[i][j] + (matrix1[i][m] * matrix2[m][j]);
            }
        }
    }

    for (int i = 0; i < row1; i++)
    {
        for (int j = 0; j < col2; j++)
        {
            printf("%d ", matrixM);
        }
        printf("\n");
    }

    return 0;
}
