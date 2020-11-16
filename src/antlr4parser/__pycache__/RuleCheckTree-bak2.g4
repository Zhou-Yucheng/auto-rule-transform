grammar RuleCheckTree;

/* Parser Rules */
rctree: pnode+ NEWLINE*?;

//prs: may not complete: ((())], (((())]], [(()))
//pr:  complete: ((()()))()

// prs:    PROP+ pr
//     |   pr
//     |   pr req
// ;

// pr:     PROP pr+ req
//     |   PROP req
// ;

pnode: PROP pnode+ req
    | PROP req
    | PROP
    | req
;

req: CMP? ROBJ? RPROP;


/* Lexer Rules */
// use non-greedy
PROP:   STRING '/prop' 'x'?;
CMP:    STRING '/cmp';
ROBJ:   STRING '/' 'a'? 'Robj';
RPROP:  STRING '/' 'a'? 'Rprop' 'x'?;

fragment STRING: (~[ /\t\r\n])*?;
NEWLINE: '\r'?'\n';
WS:     [ \t]+ -> skip;
OBJ:    STRING '/obj' -> skip;
OTHER:  STRING '/O' -> skip;
COMMENT: '#'~[\r\n]* NEWLINE -> skip ;

/* Example: 
aaa/prop bb/cmp cccc/Rprop */