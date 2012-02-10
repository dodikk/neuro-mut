#include "stdafx.h"
#include "IO.h"

using namespace ::IO;
using namespace ::Graph;
using namespace ::Graph::Algorithm;

std::string IO::ReadInputFile(const char* fileName)
{
    std::ifstream f;
    f.open(fileName);
    Common::ScopedAction streamGuard(
        boost::bind(&std::ifstream::close, &f ));

    std::string buffer;
    std::string result;

    while (false == f.eof())
    {
        getline(f, buffer);
        result += buffer;
    }


    return result;
}

void IO::WriteString(const char* fileName, 
                     const std::string& result)
{
    std::ofstream f;
    f.open(fileName);
    Common::ScopedAction streamGuard(
        boost::bind(&std::ofstream::close, &f ));


    f<<result;
}
void IO::WriteBoostMatrix(std::ostream& stream, const AdjacencyMatrix& matr)
{
    size_t rowCount = matr.size1();
    size_t colCount = matr.size2();

    stream << rowCount << " ";
    stream << colCount << " ";

    for (size_t row = 0; row < rowCount; ++row)
        for (size_t col = 0; col < colCount; ++col)
        {
            stream << matr(row, col) << " ";
        }
}

void IO::WriteStrings(const char* fileName, 
                      const string_vt& result)
{
    const char delimiter = '\n';

    std::ofstream f;
    f.open(fileName);
    Common::ScopedAction streamGuard(
        boost::bind(&std::ofstream::close, &f ));

    for (string_vt::const_iterator it = result.begin();
         it != result.end();
         ++it)
    {
        f << (*it) << delimiter;
    }
}


void IO::WriteTopoSortedItems(std::ostream& stream, const TopoSorter::Items& items)
{
    using namespace ::boost;

    stream << items.size() << " ";

    BOOST_FOREACH(const TopoSorter::Item& item, items)
    {
        stream 
            << item.first << " " 
            << item.second<< " ";
    }
}


