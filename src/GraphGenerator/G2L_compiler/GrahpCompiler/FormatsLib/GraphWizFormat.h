#ifndef __GRAPHWIZ_FORMAT_H_
#define __GRAPHWIZ_FORMAT_H_

#include "AFormat.h"

namespace Formats
{
    class GraphWizFormat : public AFormat
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
