#ifndef __TOPO_SORTER_H__
#define __TOPO_SORTER_H__

#include <utility>
#include <vector>

#include "GraphBuilder.h"
#include "TSorterDefines.h"

namespace Graph
{
    namespace Algorithm
    {
        class TopoSorter
        {
        public:
            typedef size_t Weight;
            typedef size_t Index;
            typedef std::pair<Weight, Index> Item;
            typedef std::vector<Item> Items;

        public:
            Items Sort(const ::Graph::AdjacencyMatrix& matr);

        private:
            size_t DeepSearchLength(
                const ::Graph::AdjacencyMatrix& inG, 
                boolean_vt& inOutVisitedVertexes,
                size_t startVertexIndex);

        private:
            boolean_vt visitedVertexes_;
        };
    }
}


#endif

