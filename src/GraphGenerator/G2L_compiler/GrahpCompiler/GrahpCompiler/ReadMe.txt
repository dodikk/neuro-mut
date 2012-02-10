Launch parameters :

GraphCompiler.exe <input file> <output file> [<format> <log file>]

Supported formats id's :
	Adj.Matrix
	GraphWiz
	Conn.Map (default)


Example : 
	GraphCompiler.exe tree.txt tree.gv GraphWiz log.txt
	GraphCompiler.exe tree.txt tree.gv Adj.Matrix log.txt