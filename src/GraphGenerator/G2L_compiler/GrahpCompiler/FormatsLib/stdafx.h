// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#define WIN32_LEAN_AND_MEAN             // Exclude rarely-used stuff from Windows headers

#include "targetver.h"

#include "IO.h"
#include "GraphConverter.h"
#include "ScopedAction.h"
#include "TopoSorter.h"

#include <boost/bind.hpp>
#include <boost/graph/graphviz.hpp>
#include <boost/foreach.hpp>


#include <stdio.h>
#include <tchar.h>

#include <iostream>
#include <fstream>
#include <algorithm>

// TODO: reference additional headers your program requires here
