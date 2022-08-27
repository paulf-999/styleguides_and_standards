find:
	#find / -name <filename> 2>/dev/null
	find / -name "pattern" 2>/dev/null

scp:
	scp –P 2222 [path to file] root@localhost:/root
