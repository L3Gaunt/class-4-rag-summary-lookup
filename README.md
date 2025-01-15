# Summary Lookup RAG

## Introduction
In this project, we use summary lookup RAG to help narrow the focus of the retrieval from the vector database by first running a query on document summaries, and then querying relevant chunks of data from the selected documents.

## Prerequisites
- Docker
- Python 3.11 (local setup)
- Pinecone account

## Setup

### 1. Create a Pinecone Index:
Before running the application, you need to set up two Pinecone indices:

1. Log in to your Pinecone account at https://app.pinecone.io/
2. Navigate to the "Indexes" section and click "Create Index"
3. Fill in the following details:
   - Name: Choose a semantic name for your summary index (e.g., "summary-index")
   - Dimensions: Set to `1536`
   - Metric: Choose `cosine`
4. For Environment and Region (free tier):
   - Cloud Provider: Select `aws`
   - Region: Choose `us-east-1`
5. Click "Create Index" to confirm
6. Create a second index for your chunks, following the above procedure
7. For the second index, give the index a semantic name (e.g., "chunk-index")

Remember the names you gave to your indices, as you'll need them for the `.env` file.

### 2. Set up environment variables:
- Copy the sample environment file:
  ```
  cp .env.sample .env
  ```
- Edit the `.env` file and add your API keys and other required variables:
  ```
   OPENAI_API_KEY=<your-openai-key>
   LANGCHAIN_API_KEY=<your-langsmith-key>
   LANGCHAIN_TRACING_V2=true
   LANGCHAIN_PROJECT=gauntlet_class_4
   PINECONE_API_KEY=<your-pinecone-key>
   PINECONE_SUMMARY_INDEX=<your-summary-index-name>
   PINECONE_CHUNK_INDEX=<your-chunk-index-name>
  ```
  Make sure to use the relevant index names you created for `PINECONE_SUMMARY_INDEX` and `PINECONE_CHUNK_INDEX`

## Start Docker

1. Build the Docker image:
   ```
   docker build -t office-hours-two .
   ```

2. Run the upload scripts:
   ```
   docker compose run --rm upload_summaries
   docker compose run --rm upload_chunks
   ```

3. Run the main file:
   ```
   docker compose run --rm summary_lookup
   ```

4. Run a specific script (any new `.py` file you may add):
   ```
   docker compose run --rm summary_lookup python <script_name.py>
   ```

Note: The Docker setup will automatically use the environment variables from your `.env` file. You don't need to export them to your system environment when using Docker.

## Running Different Scripts
You can use the provided `run.sh` script for easier execution.
Make sure to make the script executable with `chmod +x run.sh` in the CLI before using:
```
./run.sh upload_summaries
./run.sh upload_chunks
./run.sh main
./run.sh <your_new_py_file>
```

## Local Setup (Alternative to Docker)
If you prefer to run the examples locally:

1. Ensure you have Python 3.11.0 or higher installed.
2. Clone the repository:
   ```
   git clone [repository-url]
   cd [repository-name]
   ```
3. Set up the environment:
   ```
   python3 -m venv .venv
   source .venv/bin/activate  # On Windows use `.venv\Scripts\activate`
   pip install -r requirements.txt
   ```
4. Configure environment variables as described in the Setup section.
5. Run the files:
   ```
   python3 upload_summaries.py
   python3 upload_chunks.py
   python3 main.py
   ```

## Need Help?
Reach out to the course instructor or learning assistant
