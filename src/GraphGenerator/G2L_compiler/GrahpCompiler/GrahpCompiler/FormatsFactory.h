#ifndef __FORMATS_FACTORY_H_
#define __FORMATS_FACTORY_H_

#include "IFormat.h"
#include "Graph.h"
#include <string>
#include <map>

namespace Formats
{
    class FormatsFactory
    {
    public:
        typedef std::string FormatId;

    public:
        FormatsFactory();
        Formats::IFormatPtr GetFormat(FormatId id) const;

    private:
        void InitializeMap();

    private:
        mutable std::map<FormatId, IFormatPtr> formatsMap_;
    };
}

#endif