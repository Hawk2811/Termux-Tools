/*
* Termux Login Password
*/

//Include Libraries
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>

int main(){
	char username[20]; //Username String
	char password[20]; //Password String

	while(true){ //Loop to Prevent Access Termux Shell with Incorrect Login or Password 
		//Login Input
		printf("Termux Login: ");
		scanf("%s", &username);
		printf("\nPassword: ");
		scanf("%s", &password);
		//Username Password Verify
		if (strcmp(username, "yourusername")==0) {//Change is Camp with your Username!!!
			if (strcmp(password, "yourpassword")==0) {//Change is Camp with your Password!!!
				printf("\nLast Login: ");
				system("date");
				printf("\n");
				break;
		//Incorrect Login Message
			} else {
				printf("Login Incorrect\n");
			}
		} else {
			printf("Login Incorrect\n");
		}
	}
}