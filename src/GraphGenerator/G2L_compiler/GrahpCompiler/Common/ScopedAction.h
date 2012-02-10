#ifndef _SCOPED_ACTION_H_
#define _SCOPED_ACTION_H_

#include <boost/function.hpp>
#include <boost/noncopyable.hpp>
#include <assert.h>

namespace Common
{
    class ScopedAction : private boost::noncopyable
    {
    public:
        ScopedAction(const boost::function<void()>& func) : 
          needAction_(true), 
              function_(func)
          {

          }

          virtual ~ScopedAction()
          {
              Action();
          }

          inline void Release()
          {
              needAction_ = false;
          }

          inline void Reset(const boost::function<void()>& func)
          {
              Action();
              function_ = func;
          }

          inline void Reset()
          {
              Action();
          }

    private:

        inline void Action()
        {
            if (needAction_)
            {
                try
                {
                    function_();
                    needAction_ = false;
                }
                catch (...) 
                {
                    assert(false);
                }
            }
        }

    private:
        boost::function<void()> function_;
        bool needAction_;

    };
}
#endif // _SCOPED_ACTION_H_