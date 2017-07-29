#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mach/mach.h>

int main(int argc, const char **argv)
{
    int off = 1;
#ifndef NO_MACH
    bool mach = false;
#endif
    for(; off < argc; ++off)
    {
        if(argv[off][0] != '-' || (argv[off][0] >= '0' && argv[off][0] <= '9')) break;
#ifndef NO_MACH
        if(strcmp(argv[off], "-m") == 0) mach = true;
#endif
        else
        {
            fprintf(stderr, "[!] Invalid argument: %s\n", argv[off]);
            return 1;
        }
    }
    if(argc - off < 1)
    {
        fputs("[!] Too few arguments.\n", stderr);
        return 1;
    }
    int i = (int)strtoul(argv[off], NULL, 0);
    const char *s =
#ifndef NO_MACH
    mach ? mach_error_string(i) :
#endif
    strerror(i);
    printf("%s\n", s);
    return 0;
}
