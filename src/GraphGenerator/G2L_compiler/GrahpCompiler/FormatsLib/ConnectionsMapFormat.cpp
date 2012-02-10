#include "stdafx.h"
#include "ConnectionsMapFormat.h"

using namespace Formats;
using namespace Graph;

void ConnectionsMapFormat::InnerSaveToFile(
    std::ostream& stream, 
    AdjacencyMatrix& matr,
    const ::Graph::Graph& gr)
{
    ParentClass::InnerSaveToFile(stream, matr, gr);

    size_t_vt inputIndexes = GetInputIndexes(gr);
    size_t_vt outputIndexes = GetOutputIndexes(gr);

    IO::WriteVector(stream, inputIndexes);
    IO::WriteVector(stream, outputIndexes);
}


size_t_vt ConnectionsMapFormat::GetInputIndexes(const ::Graph::Graph& plainGraph)
{
    size_t_vt result;

    ::Graph::Graph::const_iterator it = plainGraph.begin();
    size_t index = 0;

    while ( it != plainGraph.end() )
    {
        if (true == (*it)->attr_.GetInputFlag())
        {
            result.push_back(index);
        }

        ++it;
        ++index;
    }

    return result;
}

size_t_vt ConnectionsMapFormat::GetOutputIndexes(const ::Graph::Graph& plainGraph)
{
    size_t_vt result;


    ::Graph::Graph::const_iterator it = plainGraph.begin();
    size_t index = 0;

    while ( it != plainGraph.end() )
    {
        if (true == (*it)->attr_.GetOutputFlag())
        {
            result.push_back(index);
        }

        ++it;
        ++index;
    }

    return result;
}