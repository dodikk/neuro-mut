#ifndef __ADJACENCY_MATRIX_FORMAT_H_
#define __ADJACENCY_MATRIX_FORMAT_H_

#include "AFormat.h"

namespace Formats
{
    class AdjacencyMatrixFormat : public AFormat
    {
    public:
        typedef AFormat ParentClass;

    protected:
        virtual void InnerSaveToFile(
            std::ostream& stream, 
            ::Graph::AdjacencyMatrix& matr,
            const ::Graph::Graph& gr);
    };
}

#endif
