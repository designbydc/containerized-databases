getContainerName() {
    docker ps -f name=${containerName} --format "{{.Names}}"
}