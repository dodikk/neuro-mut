#ifndef __CONNECTIONS_MAP_FORMAT_H_
#define __CONNECTIONS_MAP_FORMAT_H_

#include "AdjacencyMatrixFormat.h"
#include "GraphBuilder.h"
#include "Types.h"

namespace Formats
{
    class ConnectionsMapFormat : public AdjacencyMatrixFormat
    {
    public:
        typedef AdjacencyMatrixFormat ParentClass;

    protected:
        virtual void InnerSaveToFile(
            std::ostream& stream, 
            ::Graph::AdjacencyMatrix& matr,
            const ::Graph::Graph& gr);

    private:
        size_t_vt GetInputIndexes(const ::Graph::Graph& plainGraph);
        size_t_vt GetOutputIndexes(const ::Graph::Graph& plainGraph);
    };
}

#endif
