#include "stdafx.h"
#include "Utilities.h"

using namespace Utilities;
using namespace std;

string Utilities::UpperCase(const string& source)
{
    string result;

    size_t length = source.size();
    for (size_t i = 0; i < length; ++i)
    {
        result.push_back( toupper(source[i]) );
    }

    return result;
}