#include "stdafx.h"
#include "UnionWrapper.h"

#include <algorithm>
using namespace Common;

UnionWrapper::~UnionWrapper()
{
    try
    {
        DeInitialize();
    }
    catch (...)
    {    	
    }
}

UnionWrapper::UnionWrapper() :
    type_(STUnknown)
{    
    core_.stringValue = NULL;
}

UnionWrapper::UnionWrapper(int intValue) :
    type_(STInt)
{
    core_.intValue = intValue;
}

UnionWrapper::UnionWrapper(const char* stringValue) :
    type_(STAnsiString)
{
    core_.stringValue = strdup(stringValue);
}

void UnionWrapper::DeInitialize()
{
    if (STAnsiString == type_)
    {
        free(core_.stringValue);
    }
}

const YYSTYPE& UnionWrapper::GetRawData() const
{
    return core_;
}

void UnionWrapper::Swap(UnionWrapper& left, 
                        UnionWrapper& right)
{
    std::swap(left.type_, right.type_);
    std::swap(left.core_, right.core_);
}

void UnionWrapper::SetIntValue(int intValue)
{
    UnionWrapper tmp(intValue);
    Swap(*this, tmp);
}

void UnionWrapper::SetAnsiStringValue(const char* stringValue)
{
    UnionWrapper tmp(stringValue);
    Swap(*this, tmp);
}