#ifndef __MATRIX_UTILS_H_
#define __MATRIX_UTILS_H_

#include <boost/numeric/ublas/matrix.hpp>
#include <boost/numeric/ublas/matrix_proxy.hpp>

#include "Tracer.h"

namespace Matrix
{
    class RangeInserter
    {
    public:
        template <typename T>
        static boost::numeric::ublas::matrix<T> InsertRange(
            boost::numeric::ublas::matrix<T>& dest,
            boost::numeric::ublas::matrix<T>& src,
            size_t row = 0,
            size_t col = 0);

    private:
        template <typename T>
        static void CopyNorthWest(
            boost::numeric::ublas::matrix<T>& dest,
            boost::numeric::ublas::matrix<T>& src,
            size_t row,
            size_t col,
            boost::numeric::ublas::matrix<T>& result);

        template <typename T>
        static void CopyNorthEast(
            boost::numeric::ublas::matrix<T>& dest,
            boost::numeric::ublas::matrix<T>& src,
            size_t row,
            size_t col,
            boost::numeric::ublas::matrix<T>& result);

        template <typename T>
        static void CopySouthWest(
            boost::numeric::ublas::matrix<T>& dest,
            boost::numeric::ublas::matrix<T>& src,
            size_t row,
            size_t col,
            boost::numeric::ublas::matrix<T>& result);

        template <typename T>
        static void CopySouthEast(
            boost::numeric::ublas::matrix<T>& dest,
            boost::numeric::ublas::matrix<T>& src,
            size_t row,
            size_t col,
            boost::numeric::ublas::matrix<T>& result);

        template <typename T>
        static void CopyMiddle(
            boost::numeric::ublas::matrix<T>& dest,
            boost::numeric::ublas::matrix<T>& src,
            size_t row,
            size_t col,
            boost::numeric::ublas::matrix<T>& result);
    };
}
/***************************************************************/
/***************************************************************/
/***************************************************************/
template <typename T>
boost::numeric::ublas::matrix<T> Matrix::RangeInserter::InsertRange(
    boost::numeric::ublas::matrix<T>& dest,
    boost::numeric::ublas::matrix<T>& src,
    size_t row,
    size_t col)
{
    using namespace boost::numeric::ublas;

    size_t destRowCount = dest.size1();
    size_t destColCount = dest.size2();

    size_t srcRowCount = src.size1();
    size_t srcColCount = src.size2();

    size_t resRowCount = destRowCount + srcRowCount - 1;
    size_t resColCount = destColCount + srcColCount - 1;

    WriteToLog("Expanding matrix : \n");
    WriteToLog(dest);

    WriteToLog("Inserting matrix : \n");
    WriteToLog(src);

    WriteToLog("Inserting to \n");
    WriteToLog("    Row = "); WriteToLog(row);
    WriteToLog("    Col = "); WriteToLog(col);
    WriteToLog("\n");

    matrix<T> result = zero_matrix<MatrixValueType>(resRowCount, resColCount);
    CopyNorthWest(dest, src, row, col, result);
    CopyNorthEast(dest, src, row, col, result);
    CopySouthWest(dest, src, row, col, result);
    CopySouthEast(dest, src, row, col, result);
    CopyMiddle(dest, src, row, col, result);

    WriteToLog("Expanded matrix");
    WriteToLog(result);
    return result;
}
/***************************************************************/
template <typename T>
void Matrix::RangeInserter::CopyNorthWest(
    boost::numeric::ublas::matrix<T>& dest,
    boost::numeric::ublas::matrix<T>& src,
    size_t row,
    size_t col,
    boost::numeric::ublas::matrix<T>& result)
{
    using namespace boost::numeric::ublas;

    size_t destRowCount = dest.size1();
    size_t destColCount = dest.size2();

    size_t srcRowCount = src.size1();
    size_t srcColCount = src.size2();

    size_t resRowCount = destRowCount + srcRowCount - 1;
    size_t resColCount = destColCount + srcColCount - 1;

    if ( (row > 0) && (col > 0) )
    {
        matrix_range< matrix<T> > northWestRes = subrange(
            result, 
            0, row,
            0, col);

        matrix_range< matrix<T> > northWestDest = subrange(
            dest, 
            0, row,
            0, col);

        northWestRes = northWestDest;
    }
}
/***************************************************************/
template <typename T>
void Matrix::RangeInserter::CopyNorthEast(
    boost::numeric::ublas::matrix<T>& dest,
    boost::numeric::ublas::matrix<T>& src,
    size_t row,
    size_t col,
    boost::numeric::ublas::matrix<T>& result)
{
    using namespace boost::numeric::ublas;

    size_t destRowCount = dest.size1();
    size_t destColCount = dest.size2();

    size_t srcRowCount = src.size1();
    size_t srcColCount = src.size2();

    size_t resRowCount = destRowCount + srcRowCount - 1;
    size_t resColCount = destColCount + srcColCount - 1;


    if ( (row + srcRowCount < resRowCount) && 
         (col > 0                        ) && 
         (row + 1 < destRowCount         )    )
    {
        matrix_range< matrix<T> > southWestRes = subrange(
            result, 
            row + srcRowCount, resRowCount,
            0, col);

        matrix_range< matrix<T> > southWestDest = subrange(
            dest, 
            row + 1, destRowCount,
            0, col);

        southWestRes = southWestDest;
    }
}
/***************************************************************/
template <typename T>
void Matrix::RangeInserter::CopySouthWest(
    boost::numeric::ublas::matrix<T>& dest,
    boost::numeric::ublas::matrix<T>& src,
    size_t row,
    size_t col,
    boost::numeric::ublas::matrix<T>& result)
{
    using namespace boost::numeric::ublas;

    size_t destRowCount = dest.size1();
    size_t destColCount = dest.size2();

    size_t srcRowCount = src.size1();
    size_t srcColCount = src.size2();

    size_t resRowCount = destRowCount + srcRowCount - 1;
    size_t resColCount = destColCount + srcColCount - 1;


    if ( (row > 0                        ) && 
         (col + srcColCount < resColCount) && 
         (col + 1 < destColCount         )    )
    {
        matrix_range< matrix<T> > northEastRes = subrange(
            result, 
            0, row,
            col + srcColCount, resColCount);

        matrix_range< matrix<T> > northEastDest = subrange(
            dest, 
            0, row,
            col + 1, destColCount);

        northEastRes = northEastDest;
    }
}
/***************************************************************/
template <typename T>
void Matrix::RangeInserter::CopySouthEast(
    boost::numeric::ublas::matrix<T>& dest,
    boost::numeric::ublas::matrix<T>& src,
    size_t row,
    size_t col,
    boost::numeric::ublas::matrix<T>& result)
{
    using namespace boost::numeric::ublas;

    size_t destRowCount = dest.size1();
    size_t destColCount = dest.size2();

    size_t srcRowCount = src.size1();
    size_t srcColCount = src.size2();

    size_t resRowCount = destRowCount + srcRowCount - 1;
    size_t resColCount = destColCount + srcColCount - 1;


    if ( (row + srcRowCount < resRowCount ) && 
         (row + 1 < destRowCount          ) && 
         (col + srcColCount < resColCount ) && 
         (col + 1 < destColCount          )   )
    {
        WriteToLog("<CopySouthEast> : result matrix dump : ");
        WriteToLog(result);

        size_t seRowUpper = std::max(destRowCount, destRowCount + srcRowCount - 1);
        size_t seColUpper = std::max(destColCount, destColCount + srcColCount - 1);
        matrix_range< matrix<T> > southEastRes = subrange(
            result, 
            row + srcRowCount, seRowUpper,
            col + srcColCount, seColUpper);

        matrix_range< matrix<T> > southEastDest = subrange(
            dest, 
            row + 1, destRowCount,
            col + 1, destColCount);

        southEastRes = southEastDest;
    }
}
/***************************************************************/
template <typename T>
void Matrix::RangeInserter::CopyMiddle(
    boost::numeric::ublas::matrix<T>& dest,
    boost::numeric::ublas::matrix<T>& src,
    size_t row,
    size_t col,
    boost::numeric::ublas::matrix<T>& result)
{
    using namespace boost::numeric::ublas;

    size_t destRowCount = dest.size1();
    size_t destColCount = dest.size2();

    size_t srcRowCount = src.size1();
    size_t srcColCount = src.size2();

    size_t resRowCount = destRowCount + srcRowCount - 1;
    size_t resColCount = destColCount + srcColCount - 1;

    matrix_range< matrix<T> > middleRes = subrange(
        result, 
        row, row + srcRowCount,
        col, col + srcColCount);

    middleRes = src;
}
/***************************************************************/
/***************************************************************/
/***************************************************************/
#endif