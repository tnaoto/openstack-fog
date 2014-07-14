require 'json'
p JSON.parse(json, "{\"auth\": {\"identity\": {\"methods\": [\"password\"],\"password\": {\"user\": {\"domain\": {\"id\": \"default\"},\"name\": \"admin\",\"password\": \"changeme\"}}}}}")
