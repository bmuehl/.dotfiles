function idle
	set interval (test -n "$argv[1]"; and echo $argv[1]; or echo 10)

	echo "Moving mouse every $interval seconds. Press Ctrl+C to stop."

	while true
			# Move mouse right 3 pixel, then back left 3 pixel
			cliclick m:+3,+0
			sleep 0.1
			cliclick m:-3,+0
			
			sleep $interval
	end
end
