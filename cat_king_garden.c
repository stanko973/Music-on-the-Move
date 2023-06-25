#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

#define MAXDISC 100
#define MAXSONG 260
#define MAXARTIST 50

struct SongInfo
{
    char title[MAXSONG];
    char artist[MAXARTIST];
};

struct Collection
{
    struct SongInfo discs[MAXDISC];
    int count;
};

bool add_disc(struct Collection *collection, const char *title, const char *artist)
{
    if (collection->count == MAXDISC)
    {
        printf("Error: disc space exceeded\n");
        return false;
    }
    strcpy(collection->discs[collection->count].title, title);
    strcpy(collection->discs[collection->count].artist, artist);
    collection->count++;
    return true;
}

bool find_disc(struct Collection *collection, const char *title, 
               const char *artist)
{
    for (int i = 0; i < collection->count; i++)
    {
        if (strcmp(collection->discs[i].title, title) == 0 &&
            strcmp(collection->discs[i].artist, artist) == 0)
            return true;
    }
    return false;
}

void list_discs(struct Collection *collection)
{
    printf("Discs: \n");
    for (int i = 0; i < collection->count; i++)
    {
        printf("\t%s - %s\n", collection->discs[i].title, 
               collection->discs[i].artist);
    }
}

int main(int argc, char **argv)
{
    struct Collection collection;

    collection.count = 0;

    add_disc(&collection, "My Way", "Frank Sinatra");
    add_disc(&collection, "A Night at the Opera", "Queen");
    add_disc(&collection, "Blue", "Joni Mitchell");

    if (find_disc(&collection, "My Way", "Frank Sinatra"))
    {
        printf("Disc \"My Way\" by Frank Sinatra found\n");
    }

    list_discs(&collection);

    return 0;
}