#include <stdio.h>

//Do arithmetic to turn lowercase letters into uppercase
int main(int argc, char *argv[])
{
    if(argc != 2){
        printf("ERROR: You need one argument!\n");
        return 1;
    }

    printf("the input argument is %s\n",argv[1]);

    char lowercase[argc];
    int i = 0;
    for(i = 0; argv[1][i] != '\0'; i++){
        char letter = argv[1][i];
        int ascii = letter;
        //printf("the orignal ascii is %d\n",ascii);

        if(ascii >= 65 && ascii <= 90){
            ascii = ascii + 32;
            //printf("convert DONE; the ascii is %d\n",ascii);
            lowercase[i] = ascii;
            printf("No %d: the lowercase of %c is %c\n",i,argv[1][i],lowercase[i]);
        }else if(ascii >= 97 && ascii <= 122){
            ascii = ascii;
            lowercase[i] = ascii;
            printf("No %d: do nothing; the ascii is %d\n",i,ascii);
        }
        else{
            printf("No %d: You have enter a wrong argument!\n",i);
        }
    }
    printf("the convert result is %s\n",lowercase);
    return 0;
}