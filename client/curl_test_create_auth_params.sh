curl -H "Content-Type: application/json" \
	-X POST -d '{"sensorReadings":{"project_id":"5192307bb4d3eddd7e000002","sensors":[{"project_index":"3","readings":[{"time":"12:08"}]}]}}' \
	"http://localhost:3000/readings?auth_token=zkzXDgydHF1RCyzZ8rK5"
