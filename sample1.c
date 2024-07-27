#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main() {
    char inputString[100]; 
    printf("Please Enter the correct password: ");
    fgets(inputString, sizeof(inputString), stdin); 

    inputString[strcspn(inputString, "\n")] = '\0';

    if(strcmp(inputString, "pas123") == 0) {
        printf("You are successfully logged in");
    } else {
        for(int i = 0; i < 50; i++) { 
            sleep(1);
            printf("LOCKED\n");
        }
    }

    return 0;
}
