#ifndef __SUBGRAPH_H_
#define __SUBGRAPH_H_

#include <vector>
#include <boost/shared_ptr.hpp>
#include "Attributes.h"

namespace Graph
{
    class Vertex;
    typedef boost::shared_ptr<Vertex> VertexPtr;
    typedef std::vector<VertexPtr> Graph;
    typedef std::vector<int> Connections;

    class Vertex
    {
    public:
        std::string id_;
        Attributes attr_;
        Graph subgraph_;
        Connections connections_;
    };
}

#endif