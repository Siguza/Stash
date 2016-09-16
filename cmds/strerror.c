#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, const char **argv)
{
    if(argc < 2)
    {
        fputs("[!] Too few arguments.\n", stderr);
        return 1;
    }
    printf("%s\n", strerror(atoi(argv[1])));
    return 0;
}
