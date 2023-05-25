#include <stdio.h>

int main(int argc, char *argv[]) //argc = argument count; argv = argument vector
{
    int i = 0;
    
    for(i = 1; i < argc; i++){
        printf("arg %d: %s\n", i, argv[i]);
    }

    char *states[] = {
        "California","Oregon","Washington",NULL
    };

    argv[1] = states[1];
    //states[1] = argv[1];
    printf("the argv[1]: %s\n",argv[1]);

    int num_states = 4;

    for(i = 0; i < num_states; i++){
        printf("state %d: %s\n", i, states[i]);
    }

    return 0;
}