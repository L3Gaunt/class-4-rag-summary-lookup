if [ "$1" = "upload_summaries" ]; then
    docker compose run --rm upload_summaries
elif [ "$1" = "upload_chunks" ]; then
    docker compose run --rm upload_chunks
elif [ "$1" = "main" ]; then
    docker compose run --rm summary_lookup
else
    docker compose run --rm summary_lookup python "$1"
fi
