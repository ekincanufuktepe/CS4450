import sys
from io import StringIO
from antlr4 import *
from TinyCCodeLexer import TinyCCodeLexer
from TinyCCodeParser import TinyCCodeParser
from antlr4.tree.Trees import Trees

filepath = "./parse_c_test_code.c"

def main():
	code = "int main() { x = 3 +5; }"
	s = InputStream(code)
    # OR you can use a FileStream
    '''
    s = FileStream(filepath)
    '''
    
	lexer = TinyCCodeLexer(s)
	stream = CommonTokenStream(lexer)
	parser = TinyCCodeParser(stream)
	
	tree = parser.prog()
	
	if parser.getNumberOfSyntaxErrors() > 0:
		print("failed")
	else:
		print("passed")

main()

