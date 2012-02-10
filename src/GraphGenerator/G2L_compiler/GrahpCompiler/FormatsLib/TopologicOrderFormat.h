#ifndef __TOPOLOGIC_ORDER_FORMAT_H__
#define __TOPOLOGIC_ORDER_FORMAT_H__

#include "ConnectionsMapFormat.h"

namespace Formats
{
    class TopologicOrderFormat : public ConnectionsMapFormat
    {
    public:
        typedef ConnectionsMapFormat ParentClass;

    protected:
        virtual void InnerSaveToFile(
            std::ostream& stream, 
            ::Graph::AdjacencyMatrix& matr,
            const ::Graph::Graph& gr);
    };
}

#endif //__TOPOLOGIC_ORDER_FORMAT_H__
