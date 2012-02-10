#include "stdafx.h"
#include "GraphConverter.h"

using namespace Graph;
using namespace boost;

BoostGraph Converter::AdjacencyMatrixToBoostGraph(AdjacencyMatrix& matr)
{
    BoostGraph result;
    AdjacencyMatrix::size_type rows = matr.size1();
    AdjacencyMatrix::size_type cols = matr.size2();

    for (size_t i = 0; i < rows; ++i)
    {
        add_vertex(i, result);
    }


    for (size_t i = 0; i < rows; ++i)
        for (size_t j = 0; j < cols; ++j)
    {
        if ( matr(i, j) )
        {
            add_edge(i, j, result);
        }
    }

    return result;
}


AdjacencyMatrix Converter::BoostGraphToAdjacencyMatrix(
    const BoostGraph& g)
{
    using namespace boost::numeric::ublas;

    size_t vertexCount = num_vertices(g);
    AdjacencyMatrix result = zero_matrix<MatrixValueType>(vertexCount, vertexCount);

    typedef std::pair
        <
            BoostGraph::edge_iterator, 
            BoostGraph::edge_iterator
        > IterRange;

    typedef property_map<BoostGraph, vertex_index_t>::type VertexIndexMap;
    VertexIndexMap indexes = get(vertex_index, g);


    IterRange eRange = edges(g);
    BoostGraph::edge_iterator it = eRange.first;
    BoostGraph::edge_iterator end = eRange.second;
    

    for (; it != end; ++it)
    {
        BoostGraph::vertex_descriptor from = source(*it, g);
        BoostGraph::vertex_descriptor to   = target(*it, g);

        size_t fromIndex = indexes[from];
        size_t toIndex = indexes[to];

        result(fromIndex, toIndex) = 1;
    }


    return result;
}