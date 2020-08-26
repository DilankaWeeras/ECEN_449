#include <stdio.h>
#include <stdlib.h>



main()
{
    int row1 = 0; // initialize the cols and rows
    int col1 = 0;

    int row2 = 0;
    int col2 = 0;
    int i, j, m;


    FILE *matrixOpen1; // to open the files, i could have only used 1 but...
    FILE *matrixOpen2;
    FILE *matrixOpen3;

    if ((matrixOpen1 = fopen("inA.txt", "r")) == NULL) // error case for file not found
    {
        printf("Error! opening file");
        exit(1);
    }

    fscanf(matrixOpen1, "%d", &row1); // read in row1
    fscanf(matrixOpen1, "%d", &col1); // read in col1

    printf("Value of row1: %d\n", row1); //print r1 and c1
    printf("Value of col1: %d\n", col1);

    float **matrix1 = (float **)malloc(row1 * sizeof(float *)); // create dynamic array
    for (i = 0; i < row1; i++)
    {
        matrix1[i] = (float *)malloc(col1 * sizeof(float));
    }

    for (i = 0; i < row1; i++) // read and place into matrix1
    {
        for (j = 0; j < col1; j++)
        {
            fscanf(matrixOpen1, "%f", &matrix1[i][j]);
            printf("%f ", matrix1[i][j]);
        }
        printf("\n");
    }
    fclose(matrixOpen1); //close the file

    if ((matrixOpen2 = fopen("inB.txt", "r")) == NULL) // error case for file not fouund
    {
        printf("Error! opening file");
        exit(1);
    }

    fscanf(matrixOpen2, "%d", &row2); // read in row 2 and col 2
    fscanf(matrixOpen2, "%d", &col2);

    printf("Value of row2: %d\n", row2); // print row 2 and col 2
    printf("Value of col2: %d\n", col2);

    float **matrix2 = (float **)malloc(row2 * sizeof(float *));
    for (i = 0; i < row1; i++)
    {
        matrix2[i] = (float *)malloc(col2 * sizeof(float));
    }

    for (i = 0; i < row2; i++)
    {

        for (j = 0; j < col2; j++)
        {
            fscanf(matrixOpen2, "%f", &matrix2[i][j]);
            printf("%f ", matrix2[i][j]);
        }
        printf("\n");
    }
    fclose(matrixOpen2);

    if (col1 != row2) // error case for no multiply possible
    {
        printf("Error! Matrix sizes do not match.");
        exit(1);
    }

    //will become size row1xcol2
    if ((matrixOpen3 = fopen("outC.txt", "w")) == NULL) // error case for file not found
    {
        printf("Error! opening file");
        exit(1);
    }
    fprintf(matrixOpen3, "%d %d \n", row1, col2);

    float **matrixM = (float **)malloc(row1 * sizeof(float *)); // create multiply array
    for (i = 0; i < row1; i++)
    {
        matrixM[i] = (float *)malloc(col2 * sizeof(float));
    }
    for (i = 0; i < row1; i++) //perform matrix multiplication by adding the multiplication from the corresponing row to col
    {
        for (j = 0; j < col2; j++)
        {
            for (m = 0; m < col1; m++)
            {
                matrixM[i][j] = matrixM[i][j] + (matrix1[i][m] * matrix2[m][j]);
            }
        }
    }

    for (i = 0; i < row1; i++) //print the multiplied array
    {
        for (j = 0; j < col2; j++)
        {
            printf("%f ", matrixM[i][j]);
            fprintf(matrixOpen3,"%f ", matrixM[i][j]);
        }
        printf("\n");
    }
    fclose(matrixOpen3);

    return 0;
}
