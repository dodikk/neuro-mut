#include "StdAfx.h"
#include "TopologicOrderFormat.h"

using namespace ::Graph;
using namespace ::Graph::Algorithm;
using namespace ::Formats;

void TopologicOrderFormat::InnerSaveToFile(
    std::ostream& stream, 
    AdjacencyMatrix& matr,
    const ::Graph::Graph& gr)
{
    ParentClass::InnerSaveToFile(stream, matr, gr);

    TopoSorter sorter;
    TopoSorter::Items sortedItems = sorter.Sort(matr);

    IO::WriteTopoSortedItems(stream, sortedItems);
}

