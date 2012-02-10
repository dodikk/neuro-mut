#ifndef __IO_H_
#define __IO_H_

#include "Types.h"
#include "GraphBuilder.h"
#include "TopoSorter.h"

#include <string>
#include <algorithm>
#include <boost/bind.hpp>


namespace IO
{
    std::string ReadInputFile(const char* fileName);
    void WriteString(const char* fileName, 
                   const std::string& result);

    void WriteStrings(const char* fileName, 
                      const string_vt& result);

    void WriteBoostMatrix(std::ostream& stream, const Graph::AdjacencyMatrix& matr);

    void WriteTopoSortedItems(
        std::ostream& stream, 
        const Graph::Algorithm::TopoSorter::Items& items);

    template <typename T>
    void WriteVector(std::ostream& stream, const std::vector<T>& vect)
    {
        const char delimiter = ' ';

        const size_t rowsCount = 1;
        size_t colsCount = vect.size();
        stream << rowsCount << delimiter << colsCount << delimiter;

        for (std::vector<T>::const_iterator it = vect.begin();
             it != vect.end();
             ++it)
        {
            stream << (*it) << delimiter;
        }
    }
}

#endif
