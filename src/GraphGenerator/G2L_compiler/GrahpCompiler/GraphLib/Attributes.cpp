#include "stdafx.h"
#include "Attributes.h"

using namespace Graph;

void Attributes::SetInputFlag(bool value)
{
    value_.set(0, value);
}

void Attributes::SetOutputFlag(bool value)
{
    value_.set(1, value);
}

bool Attributes::GetInputFlag() const
{
    return value_[0];
}

bool Attributes::GetOutputFlag() const
{
    return value_[1];
}

Attributes::Attributes()
{
}

Attributes::Attributes(const BitSet& rawData) :
value_(rawData)
{
}

Attributes::~Attributes()
{
}

const Attributes::BitSet& Attributes::GetRawData() const
{
    return value_;
}