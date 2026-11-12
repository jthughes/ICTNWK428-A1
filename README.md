# ICTNWK428 A1
OSInfo Powershell Script for ICTNWK428 Assignment 1

## Task
Create a Powershell script to obtain Operating System information to assist troubleshooting.

- Must have a loop that displays a numbered menu and prompts the user to select an option.
- If the input is valid, it runs a corresponding to function to find and display the relevant OS info
- If not input is not valid, display "Error" and reprompt the user.
- Loop should remain active through any errors and only exit when the user selects the exit command option.

## Psuedocode

```
START
WHILE MENU ACTIVE
	DISPLAY MENU OPTIONS 
	PROMPT USER FOR SELECTION
	IF PROMPT IS EXIT
		EXIT LOOP		
	ELSE IF PROMPT IS VALID
TRY 	
	RUN CORRESPONDING FUNCTION
	DISPLAY OUTPUT OF FUNCTION
CATCH
	DISPLAY ERROR
ELSE
		DISPLAY “ERROR”
END
```

## Plan
- To use module to contain all relevant info gathering functions.
- Switch statement for validating menu selections
