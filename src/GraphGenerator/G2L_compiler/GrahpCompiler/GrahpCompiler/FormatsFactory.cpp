#include "stdafx.h"
#include "FormatsFactory.h"

using namespace Formats;
using namespace Graph;

FormatsFactory::FormatsFactory()
{
    InitializeMap();
}

Formats::IFormatPtr FormatsFactory::GetFormat(FormatId id) const
{
    if (formatsMap_.end() == formatsMap_.find(id))
    {
        throw std::runtime_error("Unknown format");
    }

    return formatsMap_[id];
}

void FormatsFactory::InitializeMap()
{
    formatsMap_["Conn.Map"  ] = IFormatPtr( new ConnectionsMapFormat()  );
    formatsMap_["Adj.Matrix"] = IFormatPtr( new AdjacencyMatrixFormat() );
    formatsMap_["GraphWiz"  ] = IFormatPtr( new GraphWizFormat()        );
    formatsMap_["TopoSort"  ] = IFormatPtr( new TopologicOrderFormat()  );
}
