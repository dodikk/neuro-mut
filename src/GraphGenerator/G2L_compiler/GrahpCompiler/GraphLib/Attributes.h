#ifndef __ATTRIBUTES_H_
#define __ATTRIBUTES_H_

#include <bitset>

namespace Graph
{
    class Attributes;


    class Attributes
    {
    public:
        typedef std::bitset<2> BitSet;

    public:
        void SetInputFlag(bool value = true);
        void SetOutputFlag(bool value = true);

        bool GetInputFlag() const;
        bool GetOutputFlag() const;

    public:
        Attributes();
        Attributes(const BitSet& rawData);
        ~Attributes();

    public:
        const BitSet& GetRawData() const;

    private:
        BitSet value_;
    };
}

#endif