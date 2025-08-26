#include "tokens.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    yylex();

}

int yywrap()
{
    return 1;
}