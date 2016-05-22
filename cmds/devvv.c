#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define NUM 128

typedef struct
{
    char name[48];
    char reserved_1[4];
    uint32_t size;
    char hasData;
    char reserved_2[3];
} vvv_entry_t;

int main(int argc, const char **argv)
{
    vvv_entry_t entries[NUM];
    FILE *f = fopen(argv[1], "r");
    fread(entries, 1, NUM * sizeof(vvv_entry_t), f);
    for(int i = 0; i < NUM; ++i)
    {
        if(entries[i].hasData)
        {
            char *name = entries[i].name;
            for(char *n = name + 48; n > name; --n)
            {
                if(*n == '/')
                {
                    name = n + 1;
                    break;
                }
            }
            char *buf = malloc(entries[i].size);
            fread(buf, 1, entries[i].size, f);
            FILE *fo = fopen(name, "w");
            fwrite(buf, 1, entries[i].size, fo);
            fclose(fo);
            free(buf);
        }
    }
    fclose(f);
}
