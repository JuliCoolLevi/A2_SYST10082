#!/bin/bash


#$$ is the current process executing (using echo)
echo "This process PID is $$"


#30 second pause and finding the PID of most recent background process
sleep 30 & #this symbol is used to execute in the background
child=$!; echo "Child PID is $child"


#printing and display the PID of child process
echo "Child process with PID: $child is now in the OS waiting queue"

#printing the next statement
echo "The child process is waiting for a software interrupt from the user"

#printing SIGINT interrupt
echo "Enter the SIGINT interrupt to have the child process execute on the CPU"

#-e is used to enter a new line in the output
trap 'echo -e "\nSIGINT signal received!"' 2

#waiting state the child 1
wait $child

echo "Enter SIGQUIT interrupt";

trap 'echo -e "\nSIGQUIT signal received!"' 3

#waiting state the child 2
wait $child

echo "Completed executing"

echo "Terminated all processes."

#exiting without errors
exit 0









