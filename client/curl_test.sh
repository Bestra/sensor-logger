curl -H "Authorization: Token token=zkzXDgydHF1RCyzZ8rK5" -H "Content-Type: application/json" \
	-X POST -d '{"sensorReadings":{"project_id":"123","sensors":[{"project_index":"1","readings":[{"time":"12:00","value":"3"}]}]}}' \
	http://localhost:3000/readings
