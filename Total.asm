
INCLUDE C : \Irvine\Irvine32.inc
INCLUDELIB C : \Irvine\Irvine32.lib

.data
//declare variables here
//declare arrays here

seconds DWORD ?

minutes DWORD ?

hours DWORD ?

totalSec DWORD ?

totalMin DWORD ?

buffer BYTE 10 DUP(0)  //input storing; strings here


numberSeconds BYTE "PLease enter the number of seconds: ", 0   //; messages display for sec,

numberMinutes BYTE "PLease enter the number of minutes: ", 0    //; messages display for min,

numberHours BYTE "PLease enter the number of hours: ", 0       //; messages display for hrs.


inputInvalid BYTE "Inncorrect input please enter a number value ", 0 //; messages display for invalid input


//; declare strings here - output

outputDisplay BYTE " The number of seconds you entered is %d.", 13, 10,

" The number of minutes you entered is %d.", 13, 10,

" The number of hours you entered is %d.", 13, 10,

" The total number of seconds is %d.", 13, 10,

" The total number of seconds is %d.", 13, 10,

startOver BYTE "Would you like to start over (Y/N) ? " 0




.code
main PROC


call ReadNumInput     //; ask the user to enter hours

mov hours, eax        //; Store user input for hours


call ReadNumInput     //; ask the user to enter minutes

mov minutes, eax         //; Store user input for minutes


call ReadNumInput        //; ask the user to enter seconds


mov seconds, eax            //; Store user input for seconds


mov eax, hours           //; Compute total seconds


imul eax, 3600           //; Convert hours to seconds

mov totalSeconds, eax

mov eax, minutes

imul eax, 60   //minutes to seconds


add totalSeconds, eax

add totalSeconds, seconds         //; Add seconds to total count


mov eax, totalSeconds      //; total minutes

mov edx, 60

div edx             //; Convert total seconds into minutes

mov totalMinutes, eax


printf outputFormat, hours, minutes, seconds, totalMinutes, totalSeconds  //; Output the results


mov edx, OFFSET startOver         //; Ask the user if they want to repeat the program
call WriteString
call ReadChar

cmp al, 'y'; Check if user entered 'y'
je main                                  //; Restart the program if yes

exit                                 //; Exit program if no
main ENDP

ReadNumInput PROC                //; Read string input from user

call ReadString


mov esi, OFFSET buffer


call StrToInt              //; string to integer

ret
ReadNumInput ENDP







INVOKE ExitProcess, 0

main ENDP

END main
