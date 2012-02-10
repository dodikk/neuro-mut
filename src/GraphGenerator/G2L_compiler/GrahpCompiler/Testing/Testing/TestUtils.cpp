#include "stdafx.h"
#include "TestUtils.h"

using namespace Graph;


bool ::Graph::operator==(const AdjacencyMatrix& left, 
                const AdjacencyMatrix& right)
{
    WriteToLog("Comparing matrices");
    WriteToLog("Left matrix");
    WriteToLog(left);
    WriteToLog("Right matrix");
    WriteToLog(right);

    if (  !(left.size1() == right.size1()) ||
          !(left.size2() == right.size2())
       )
    {
        return false;
    }

    AdjacencyMatrix::size_type rows = left.size1();
    AdjacencyMatrix::size_type cols = left.size2();

    for (AdjacencyMatrix::size_type i = 0; i < rows; ++i)
        for (AdjacencyMatrix::size_type j = 0; j < cols; ++j)
    {
        MatrixValueType l = left(i, j);
        MatrixValueType r = right(i, j);
        if (l != r)
        {
            return false;
        }
    }

    return true;
}

