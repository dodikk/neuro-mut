#ifndef __A_FORMAT_H_
#define __A_FORMAT_H_

#include "IFormat.h"
#include "Graph.h"
#include "GraphBuilder.h"

namespace Formats
{
    class AFormat : public IFormat
    {
    public:
        virtual void SaveToFile(
                        std::ostream& stream, 
                        ::Graph::Graph& gr);

    protected:
        virtual void InnerSaveToFile(
            std::ostream& stream, 
            ::Graph::AdjacencyMatrix& matr,
            const ::Graph::Graph& gr) = 0;

    private:
        ::Graph::AdjacencyMatrix GetMatrix(::Graph::Graph& gr);
    };
}

#endif