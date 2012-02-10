#include "stdafx.h"




int main(int argc, char** argv)
{
    try
    {
        const int requiredParamsCount = 2;

        if (argc < requiredParamsCount + 1)
        {
            return -1;
        }

        std::string input = IO::ReadInputFile(argv[1]);
        std::istrstream inStream(input.c_str(), input.size());
        Parser::G2LParser parser(&inStream);
        yyparse(&parser);
        Graph::Graph rawGraph = parser.GetParsedData();


        Formats::FormatsFactory factory;
        std::string formatId = "Conn.Map";
        const std::string& log = parser.GetLog();

        if (argc >= 1 + requiredParamsCount + 1)
        {
            formatId = argv[3];
        }

        if (argc >= 1 + requiredParamsCount + 2)
        {
            IO::WriteString(argv[4], log);
        }


       
        Formats::IFormatPtr format = factory.GetFormat(formatId);

        std::ofstream f;
        f.open(argv[2]);
        Common::ScopedAction streamGuard(
            boost::bind(&std::ofstream::close, &f ));
        format->SaveToFile(f, rawGraph);

        return 0;
    }
    catch(...)
    {
        std::cout<<"Unknown error recieved.";
        return 1;
    }
}
