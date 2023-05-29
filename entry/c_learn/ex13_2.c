#include <stdio.h>

int main(int argc, char *argv[])
{
    //if(argc != 2){
    //    printf("ERROR: You need one argument!\n");
    //    return 1;
    //}

    int i = 0;
    int j = 1;
    for(j = 1; j <= argc; j++){
        for(i = 0; argv[j][i] != '\0'; i++){
            char letter = argv[j][i];

            switch(letter){
                case'a':
                case'A':
                    printf("[%d,%d]: 'A'\n", j,i);
                    break;

                case'e':
                case'E':
                    printf("[%d,%d]: 'E'\n", j,i);
                    break;

                case'i':
                case'I':
                    printf("[%d,%d]: 'I'\n", j,i);
                    break;

                case'o':
                case'O':
                    printf("[%d,%d]: 'O'\n", j,i);
                    break;

                case'u':
                case'U':
                    printf("[%d,%d]: 'U'\n", j,i);
                    break;

                case'y':
                case'Y':
                    if(i > 2){
                        printf("[%d,%d]: 'Y'\n",j,i);
                    }
                    break;
                
                default:
                    printf("[%d,%d]: %c is not a vowel\n",j,i,letter);
            }
        }
    }
    return 0;
}