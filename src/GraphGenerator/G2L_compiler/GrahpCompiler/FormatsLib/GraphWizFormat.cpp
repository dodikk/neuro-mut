#include "stdafx.h"
#include "GraphWizFormat.h"

using namespace ::Formats;
using namespace ::Graph;

void GraphWizFormat::InnerSaveToFile(
        std::ostream& stream, 
        ::Graph::AdjacencyMatrix& matr,
        const ::Graph::Graph& gr)
{
    BoostGraph bGraph = Converter::AdjacencyMatrixToBoostGraph(matr);
    write_graphviz(stream, bGraph);
}