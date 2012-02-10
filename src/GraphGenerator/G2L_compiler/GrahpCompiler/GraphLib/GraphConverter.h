#ifndef __GRAPH_CONVERTER_H_
#define __GRAPH_CONVERTER_H_

#include <boost/graph/adjacency_list.hpp>
#include "GraphBuilder.h"

namespace Graph
{
    typedef boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS,
                                   boost::property<boost::vertex_color_t, int>, 
                                   boost::property<boost::edge_index_t, int>
                                 > 
    BoostGraph;

    class Converter
    {
    public:
        static BoostGraph AdjacencyMatrixToBoostGraph(AdjacencyMatrix& matr);
        static AdjacencyMatrix BoostGraphToAdjacencyMatrix(const BoostGraph& graph);
    };
}

#endif //__GRAPH_CONVERTER_H_