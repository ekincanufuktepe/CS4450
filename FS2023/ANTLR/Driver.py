import sys
from io import StringIO
from antlr4 import *
from ExprLexer import ExprLexer
from ExprParser import ExprParser

#def main(argv):
def main():
	valid_strings = ["10+20*30", "234", "5*2", "2+3+2", "0*9*1"]
	invalid_strings = ["+", "10++10", "*", "+*"]
	#inp_stream = FileStream(argv[1])
	#print(inp_stream)
	for x in valid_strings:
		s = InputStream(x)
		#lexer = ExprLexer(inp_stream)
		lexer = ExprLexer(s)
		stream = CommonTokenStream(lexer)
		parser = ExprParser(stream)
		tree = parser.prog()
		if parser.getNumberOfSyntaxErrors() > 0:
			print("failed: " + s)
		else:
			print("passed!")

	for x in invalid_strings:
		s = InputStream(x)
		#lexer = ExprLexer(inp_stream)
		lexer = ExprLexer(s)
		stream = CommonTokenStream(lexer)
		parser = ExprParser(stream)
		tree = parser.prog()
		if parser.getNumberOfSyntaxErrors() > 0:
			print("passed!")
		else:
			print("failed: " + s)

if __name__ == '__main__':
	#main(sys.argv)
	main()
