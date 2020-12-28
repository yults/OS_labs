net stop Dnscache
timeout /T 5
queryex type=service state=all > newservices.txt
./comparator.bat 
net start Dnscache