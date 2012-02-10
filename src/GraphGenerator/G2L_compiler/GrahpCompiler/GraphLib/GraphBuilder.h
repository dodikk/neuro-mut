#ifndef __GRAPH_BUILDER_H_
#define __GRAPH_BUILDER_H_

#include <boost/numeric/ublas/matrix.hpp>
#include "Graph.h"

namespace Graph
{
    typedef int MatrixValueType;
    typedef boost::numeric::ublas::matrix<MatrixValueType> AdjacencyMatrix;

    class Builder
    {
    public:
        AdjacencyMatrix GetAdjacencyMatrix(Graph& graph);

    private:
        AdjacencyMatrix GetAdjacencyMatrixSimple(const Graph& graph);

        void EstablishConnection(AdjacencyMatrix & matr, int vertex, int localConnection);

    private:
        AdjacencyMatrix ExpandVertexes(
            AdjacencyMatrix& matr, 
            Graph& graph);

        AdjacencyMatrix ExpandVertex(
            AdjacencyMatrix& matr, 
            ::Graph::Graph& graph,
            size_t vertexIndex);

    private:
        void FillInputs(
            AdjacencyMatrix& matr, 
            ::Graph::Graph& graph,
            size_t vertexIndex,
            size_t insertedSize,
            AdjacencyMatrix& result);

        void FillOutputs(
            AdjacencyMatrix& matr, 
            ::Graph::Graph& graph,
            size_t vertexIndex,
            size_t insertedSize,
            AdjacencyMatrix& result);

        void FixSelfConnections(
            AdjacencyMatrix& matr, 
            ::Graph::Graph& graph,
            size_t vertexIndex,
            size_t insertedSize,
            AdjacencyMatrix& result);

        void UpdateVertexList(
            ::Graph::Graph& graph,
            size_t vertexIndex);
    };
}


#endif