grammar TinyCCode;

prog:	'int main()' '{' expr '}' EOF;

endExpr: expr ';' ;

expr:	assignment
	| expr ('+'|'-') expr
	| expr ('*'|'/') expr
	| INT ;

INT:	[0-9]+;
VARNAME: [a-zA-Z]+;
assignment:	VARNAME '=' expr ';';

WS:	[ \t\r\n]+ -> skip;
