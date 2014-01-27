for zop in $(seq 1 10); do 
	echo "puddin pudding pop pops potato zip zop zoobity woobity wop bop zoo boopity zoopity wobitywop" 2>/dev/null | tr ' ' '\n' 2>/dev/null | shuf 2>/dev/null | head -n1 2>/dev/null
done | tr '\n' ' ';echo
