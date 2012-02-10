#include "StdAfx.h"
#include "TopoSorter.h"

using namespace ::Graph;
using namespace ::Graph::Algorithm;


TopoSorter::Items TopoSorter::Sort(const AdjacencyMatrix& matr)
{
    assert(matr.size1() == matr.size2());

    Items result;
    size_t vertexCount = matr.size1();



    for (size_t vertexIndex = 0; 
         vertexIndex < vertexCount; 
         ++vertexIndex)
    {
        boolean_vt visitedVertexes(vertexCount, tsFalse);

        size_t weight = DeepSearchLength(matr, visitedVertexes, vertexIndex);
        Item newItem(weight, vertexIndex);
        result.push_back(newItem);
    }

    std::sort(result.begin(), result.end());
    std::reverse(result.begin(), result.end());


    return result;
}




size_t TopoSorter::DeepSearchLength(
    const ::Graph::AdjacencyMatrix& inG, 
    boolean_vt& inOutVisitedVertexes,
    size_t startVertexIndex)
{
    int result = 1;

    assert(inG.size1() == inG.size2());
    size_t vertexCount = inG.size1();

    inOutVisitedVertexes.at(startVertexIndex) = tsTrue;

    for (size_t adjacentIndex = 0; 
         adjacentIndex <  vertexCount;
         ++adjacentIndex)
    {
        bool isUsed = inOutVisitedVertexes.at(adjacentIndex);

        if ( !isUsed )
        {
            bool isAdjacent = (0 != inG(startVertexIndex, adjacentIndex));
            
            if (isAdjacent)
            {
                result += DeepSearchLength(
                    inG, 
                    inOutVisitedVertexes,
                    adjacentIndex);
            }
        }
    }

    return result;
}
