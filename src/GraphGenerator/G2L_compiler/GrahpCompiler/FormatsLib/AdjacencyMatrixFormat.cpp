#include "stdafx.h"
#include "AdjacencyMatrixFormat.h"

using namespace Formats;
using namespace Graph;


void AdjacencyMatrixFormat::InnerSaveToFile(
    std::ostream& stream, 
    AdjacencyMatrix& matr,
    const ::Graph::Graph& gr)
{
    IO::WriteBoostMatrix(stream, matr);
}
