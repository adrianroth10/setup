. functions.sh
for i in {1..3}; do
	stopwatch "blabla " &
	PID=$!
	disown
	sleep 3
	kill $PID
	# wait $PID >/dev/null 2>/dev/null
done
