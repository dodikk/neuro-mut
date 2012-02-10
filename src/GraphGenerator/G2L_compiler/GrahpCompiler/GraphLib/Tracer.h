#ifndef __TRACER_H_
#define __TRACER_H_

#include <boost/numeric/ublas/io.hpp>
#include <iostream>

/***************************************************************/
    template <typename T>
    void WriteToLog(const T& item)
    {
#ifdef _LOGS
        std::cout<<item<<'\n';
#endif
    }
/***************************************************************/

#endif