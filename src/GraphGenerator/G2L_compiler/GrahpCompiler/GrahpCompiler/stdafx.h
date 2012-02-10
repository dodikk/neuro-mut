// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#include "targetver.h"

#include "IO.h"
#include "GraphConverter.h"

#include "AdjacencyMatrixFormat.h"
#include "GraphWizFormat.h"
#include "ConnectionsMapFormat.h"
#include "TopologicOrderFormat.h"


#include "G2lParser.h"
#include "Graph.h"
#include "FormatsFactory.h"
#include "ScopedAction.h"


#include <stdio.h>
#include <tchar.h>

#include <iostream>
#include <fstream>
#include <strstream>
#include <boost/bind.hpp>
#include <boost/graph/graphviz.hpp>


// TODO: reference additional headers your program requires here
