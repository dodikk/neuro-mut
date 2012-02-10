#ifndef __I_FORMAT_H_
#define __I_FORMAT_H_

#include <iostream>
#include <fstream>
#include <boost/shared_ptr.hpp>

#include "Graph.h"

namespace Formats
{
    class IFormat
    {
    public:
        virtual ~IFormat() {};
        virtual void SaveToFile(std::ostream& stream, ::Graph::Graph& gr) = 0;
    };

    typedef boost::shared_ptr<IFormat> IFormatPtr;
}

#endif
