#include "stdafx.h"
#include "AFormat.h"

using namespace ::Formats;
using namespace Graph;

AdjacencyMatrix AFormat::GetMatrix(::Graph::Graph& gr)
{
    ::Graph::Builder builder;
    AdjacencyMatrix matr = builder.GetAdjacencyMatrix(gr);
    return matr;
}

void AFormat::SaveToFile(
    std::ostream& stream, 
    ::Graph::Graph& gr)
{
    AdjacencyMatrix matr = GetMatrix(gr);
    InnerSaveToFile(stream, matr, gr);
}
