%     typedef ::Functions::IFunctionPtr FunctionType;
%     //typedef double ( *FunctionType ) ( DataArray );
% 
%     class Optimizer
%     {
%         public:
%             Optimizer ( FunctionType inF, DataArray inX );
%             virtual ~Optimizer();
%             void DoWork();
% 
%         protected:
%             Optimizer ( const Optimizer& other );
%             Optimizer& operator= ( const Optimizer& other );
% 
%         private:
%             void FindBestCandidate();
%             void AdjustStep();
% 
%         private:
%             void OnCandidateFailed();
%             void OnFirstCandidateMatch();
%             void OnStatisticGradientSucceeded();
%             void OnLaterCandidateMatch();
% 
%         private:
%             void RestoreXvData();
%             void UpdateCandidate();
% 
% 
%         private:
%             static const double INIT_SIZE;
%             static const double THRESHOLD;
% 
%         private:
%             DataSet x;      // x
%             DataSet xv;     // Candidate
% 
%         private:
%             DataArray u; // Statistic gradient
%             DataArray v; // Candidate delta (v == xv - x)
% 
%         private:
%             double vr; // MSE error value or
%                        // "vector change difference" (vOld - vNew) value
%             int vi;    // index for the scalar operations (vvec == false)
% 
%         private:
%             bool vvec; // Data set is a vector flag.
%             int iter;  // Number of iteration when the matching candidate found
% 
%         private:
%             int count;
%             // Target function calls count. Used for logging.
%             // Fictive(alvays zero) flag in current implementation.
% 
%         private:
%             FunctionType f;
%     };
