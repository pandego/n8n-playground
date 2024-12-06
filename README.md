# n8n-playground
A playground for automation using n8n.


# Ollama
If you have Ollama deployed in your local machine, you would normally point n8n to the `http://localhost:11434/` endpoint, but since n8n is deployed inside a Docker container, you have to set the Ollama endpoint as `http://host.docker.internal:11434/`.