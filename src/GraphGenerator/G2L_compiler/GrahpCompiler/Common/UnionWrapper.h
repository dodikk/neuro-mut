#ifndef CONNECTION
#include "AParser.hpp"
#endif
//////////////////////////////
#ifndef _UNION_WRAPPER_H_
#define _UNION_WRAPPER_H_

namespace Common
{
    enum SupportedTypes
    {
        STUnknown = 0,
        STInt,
        STAnsiString,
    };

    class UnionWrapper
    {
    private:
        UnionWrapper(const UnionWrapper& other);
        UnionWrapper& operator=(const UnionWrapper& other);

    public:
        static void Swap(UnionWrapper& left, UnionWrapper& right);

        virtual ~UnionWrapper();
        UnionWrapper();
        explicit UnionWrapper(int intValue);
        explicit UnionWrapper(const char* stringValue);

        const YYSTYPE& GetRawData() const;

        void SetIntValue(int intValue);
        void SetAnsiStringValue(const char* stringValue);

    private:
        void DeInitialize();

    private:
        YYSTYPE core_;
        SupportedTypes type_;
    };
}


#endif
