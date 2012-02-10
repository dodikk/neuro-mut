#include "stdafx.h"
#include "GraphBuilder.h"

using namespace ::Graph;
using namespace boost::numeric::ublas;

AdjacencyMatrix Builder::GetAdjacencyMatrix(::Graph::Graph& graph)
{
    AdjacencyMatrix matr = GetAdjacencyMatrixSimple(graph);
    matr = ExpandVertexes(matr, graph);
    
    return matr;
}

void Builder::EstablishConnection(
                         AdjacencyMatrix & matr, 
                         int vertex, 
                         int localConnection)
{
    matrix<MatrixValueType>::size_type matrixSize = matr.size1();
    int absoluteConnection = vertex + localConnection;

    if ( (absoluteConnection < 0) || 
         (static_cast<matrix<MatrixValueType>::size_type>(absoluteConnection) >= matrixSize) )
    {
        throw std::runtime_error("Wrong connection.");
    }
    else
    {
        const MatrixValueType connectedFlag = 1;
        matr(vertex, absoluteConnection) = connectedFlag;
    }
}

AdjacencyMatrix Builder::GetAdjacencyMatrixSimple(const ::Graph::Graph& graph)
{
    size_t matrixSize = graph.size();
    AdjacencyMatrix result = zero_matrix<MatrixValueType>(matrixSize, matrixSize);

    for (size_t i = 0; i < matrixSize; ++i)
    {
        size_t connectionsCount = graph[i]->connections_.size();
        for (size_t j = 0; j < connectionsCount; ++j)
        {
            EstablishConnection( result, i, graph[i]->connections_[j] );
        }
    }

    return result;
}

AdjacencyMatrix Builder::ExpandVertexes(
                               AdjacencyMatrix& matr, 
                               ::Graph::Graph& graph)
{
    AdjacencyMatrix result = matr;

    for (size_t i = 0; 
         i < graph.size(); // graph size is supposed do grow in the loop
        )
    {
        VertexPtr vertex = graph.at(i);
        result = ExpandVertex(result, graph, i);
        i += std::max<size_t>(vertex->subgraph_.size(), 1); // to match the graph's grow
    }

    return result;
}

AdjacencyMatrix Builder::ExpandVertex(
                             AdjacencyMatrix& matr, 
                             ::Graph::Graph& graph,
                             size_t vertexIndex)
{
    VertexPtr vertex = graph.at(vertexIndex);

    size_t originalMatrSize = matr.size1();    

    if ( vertex->subgraph_.empty() )
    {
        return matr;
    }

    AdjacencyMatrix subGraphMatrix = GetAdjacencyMatrix(vertex->subgraph_);
    size_t insertedSize = subGraphMatrix.size1();

    AdjacencyMatrix result = Matrix::RangeInserter::InsertRange(
                                         matr, 
                                         subGraphMatrix, 
                                         vertexIndex,
                                         vertexIndex);
    
    FillInputs(matr, graph, vertexIndex, insertedSize, result);
    WriteToLog("Matrix Inputs fixed");
    WriteToLog(result);

    FillOutputs(matr, graph, vertexIndex, insertedSize, result);
    WriteToLog("Matrix Outputs fixed");
    WriteToLog(result);

    FixSelfConnections(matr, graph, vertexIndex, insertedSize, result);

    UpdateVertexList(graph, vertexIndex);

    WriteToLog("Updated matrix");
    WriteToLog(result);

    return result;
}


void Builder::FillInputs(
                AdjacencyMatrix& matr, 
                ::Graph::Graph& graph,
                size_t vertexIndex,
                size_t insertedSize,
                AdjacencyMatrix& result)
{
    size_t graphSize = graph.size();
    size_t insertedAreaLimit = vertexIndex + insertedSize;

    VertexPtr expandedVertex = graph.at(vertexIndex);

    for (size_t i = 0; i < vertexIndex; ++i)
        for (size_t j = vertexIndex; j < insertedAreaLimit; ++j)
    {
        bool vertexInputFlag = expandedVertex->subgraph_.at(j - vertexIndex)->attr_.GetInputFlag();
        result(i, j) = matr(i, vertexIndex) && vertexInputFlag;
    }


    for (size_t i = insertedAreaLimit; i < result.size1(); ++i)
        for (size_t j = vertexIndex; j < insertedAreaLimit; ++j)
    {
        bool vertexInputFlag = expandedVertex->subgraph_.at(j - vertexIndex)->attr_.GetInputFlag();
        result(i, j) = matr(i - result.size1() + matr.size1(), vertexIndex) && vertexInputFlag;
    }
}

void Builder::FillOutputs(
                 AdjacencyMatrix& matr, 
                 ::Graph::Graph& graph,
                 size_t vertexIndex,
                 size_t insertedSize,
                 AdjacencyMatrix& result)
{
    size_t graphSize = graph.size();
    size_t insertedAreaLimit = vertexIndex + insertedSize;

    VertexPtr expandedVertex = graph.at(vertexIndex);

    for (size_t i = vertexIndex; i < insertedAreaLimit; ++i)
        for (size_t j = 0; j < vertexIndex; ++j)        
        {
            bool vertexOutputFlag = expandedVertex->subgraph_.at(i - vertexIndex)->attr_.GetOutputFlag();
            ::Graph::MatrixValueType conn = matr(vertexIndex, j);
            result(i, j) = conn && vertexOutputFlag;
        }


    for (size_t i = vertexIndex; i < insertedAreaLimit; ++i)
        for (size_t j = insertedAreaLimit; j < result.size2(); ++j)
            {
                bool vertexOutputFlag = expandedVertex->subgraph_.at(i - vertexIndex)->attr_.GetOutputFlag();
                ::Graph::MatrixValueType conn = matr(vertexIndex, j - result.size2() + matr.size2());
                result(i, j) = conn && vertexOutputFlag;
            }
}

void Builder::FixSelfConnections(
                        AdjacencyMatrix& matr, 
                        ::Graph::Graph& graph,
                        size_t vertexIndex,
                        size_t insertedSize,
                        AdjacencyMatrix& result)
{
    if ( false == matr(vertexIndex, vertexIndex) )
    {
        return;
    }

    VertexPtr expandedVertex = graph.at(vertexIndex);

    size_t graphSize = graph.size();
    size_t insertedAreaLimit = vertexIndex + insertedSize;

    for (size_t i = vertexIndex; i < insertedAreaLimit; ++i)
        for (size_t j = vertexIndex; j < insertedAreaLimit; ++j)        
        {
            bool iOutputFlag = expandedVertex->subgraph_.at(i - vertexIndex)->attr_.GetOutputFlag();
            bool jInputFlag  = expandedVertex->subgraph_.at(j - vertexIndex)->attr_.GetInputFlag();

            result(i, j) = (  result(i, j) || 
                              ( iOutputFlag && 
                                jInputFlag  )
                           );
        }
}


void Builder::UpdateVertexList(
                      ::Graph::Graph& graph,
                      size_t vertexIndex)
{
    VertexPtr vertex = graph.at(vertexIndex); //will  be out of date after insert
    size_t insertedSize = vertex->subgraph_.size();
    Attributes vertexAttr( vertex->attr_.GetRawData() );

    graph.insert(
        graph.begin() + vertexIndex, 
        vertex->subgraph_.begin(),
        vertex->subgraph_.end()
        );

    size_t insertedEnd = vertexIndex + insertedSize;
    for (::Graph::Graph::iterator it = graph.begin() + vertexIndex;
         it != graph.begin() + insertedEnd; 
         ++it)
    {
        (*it)->attr_ = (*it)->attr_.GetRawData() & vertexAttr.GetRawData();
    }

    graph.erase( graph.begin() + insertedEnd );
}
