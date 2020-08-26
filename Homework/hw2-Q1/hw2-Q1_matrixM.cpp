#include <iostream>
#include <fstream>
#include <string>
#include <cmath>

main()
{
    try
    {
        int row1 = 0;
        int col1 = 0;

        int row2 = 0;
        int col2 = 0;

        //Can take inputs up to 100 by 100
        double matrix1[100][100];
        double matrix2[100][100];

        std::ifstream in;

        in.open("matrix1.txt");

        in >> row1;
        in >> col1;

        std::cout << row1 << std::endl;
        std::cout << col1 << std::endl;

        for (int i = 0; i < row1; i++)
        {
            for (int j = 0; j < col1; j++)
            {
                in >> matrix1[i][j];
                std::cout << matrix1[i][j] << " ";
            }
            std::cout << std::endl;
        }
        std::cout << std::endl;
        in.close();

        in.open("matrix2.txt");

        in >> row2;
        in >> col2;

        std::cout << row2 << std::endl;
        std::cout << col2 << std::endl;

        if (col1 != row2)
        {
            throw "Exception";
        }

        for (int i = 0; i < row2; i++)
        {
            for (int j = 0; j < col2; j++)
            {
                in >> matrix2[i][j];
                std::cout << matrix2[i][j] << " ";
            }
            std::cout << std::endl;
        }
        std::cout << std::endl;
        in.close();
        //will become size row1-col2
        double matrixM[100][100];
        for (int i = 0; i < row1; i++)
        {
            for (int j = 0; j < col2; j++)
            {
                for (int m = 0; m < col1; m++)
                {
                    matrixM[i][j] = matrixM[i][j] + (matrix1[i][m] * matrix2[m][j]);
                }
            }
        }

        std::ofstream out;
        out.open("matrixProduct.txt");

        out << col1 << " " << row2;

        std::cout << std::endl;
        for (int i = 0; i < row1; i++)
        {
            for (int j = 0; j < col2; j++)
            {
                std::cout << matrixM[i][j] << " ";
                out << matrixM[i][j] << " ";
            }
            std::cout << std::endl;
            out << std::endl;
        }

        out.close();

        return 0;
    }
    catch (std::string e)
    {
        std::cout << "Matrix cannot be multiplied" << std::endl;
    }
}