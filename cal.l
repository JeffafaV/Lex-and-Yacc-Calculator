%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<math.h>
    #include"cal.tab.h" 
    #define BASE 10
	int yyerror(char *s);
    int c;
    
%}

%%

" ";

[a-z] {
    c = yytext[0];
    yylval.var = c - 'a';
    return (LETTER);
}

([1-9][0-9]+|[0-9])?\.[0-9]+ {
    yylval.num = atof(yytext);
    return (DIGIT);
}

([1-9][0-9]+|[0-9]) {
    yylval.num = atof(yytext);
    return (DIGIT);
}

[-+()=/*\n^]    {return *yytext;}

[ \t] ;
.   yyerror("invalid char");

sin {return SIN;}
asin {return ASIN;}
sinh {return SINH;}
cos {return COS;}
acos {return ASIN;}
cosh {return COSH;}
cube {return CUBE;}
squre {return SQURE;}
tan {return TAN;}
atan {return ATAN;}
tanh {return TANH;}
log {return LOG;}
sqrt {return SQRT;}
exp {return EXP;}
ceil {return CEIL;}
floor {return FLOOR;}
round {return ROUND;}
exit {return EXIT;}
