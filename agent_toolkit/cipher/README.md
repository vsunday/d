# Cipher MCP Server with Ollama

This directory contains the Docker configuration for running Cipher as an MCP server with Ollama as the local LLM provider.

## Quick Start

### 1. Start the services

```bash
cd agent_toolkit/cipher
docker-compose up -d
```

### 2. Pull the required models in Ollama

```bash
# Pull the main LLM model (Mistral 7B - optimized for memory management)
docker exec -it cipher-ollama ollama pull mistral:7b-instruct-v0.3

# Pull the embedding model
docker exec -it cipher-ollama ollama pull nomic-embed-text
```

### 3. Verify the services are running

```bash
# Check Ollama
curl http://localhost:11434/api/tags

# Check Cipher (if using HTTP transport)
curl http://localhost:5000/health
```

## Configuration

### Models

The configuration uses models optimized for AI memory management:

- **Main LLM**: `mistral:7b-instruct-v0.3` (4.4 GB) - Excellent for summarization and reasoning
- **Evaluation LLM**: `mistral:7b-instruct-v0.3` - Strong at reflection and memory evaluation
- **Embedding Model**: `nomic-embed-text` (274 MB) - Efficient semantic search

**Alternative Models**:
- Ultra-lightweight: `phi3:mini` (2.3 GB)
- Better context: `gemma2:9b` (5.4 GB, 128K context)
- Alternative embedding: `mxbai-embed-large` (670 MB, better semantic understanding)

### Workspace

The `./workspace` directory is mounted into the container at `/workspace`, allowing Cipher to access local files.

## Connecting IDEs

### Cursor IDE

Add this to your Cursor settings (`~/.cursor/config.json` or project-specific):

```json
{
  "mcpServers": {
    "cipher": {
      "command": "docker",
      "args": ["exec", "-i", "cipher-mcp", "cipher", "--mode", "mcp", "--agent", "/app/cipher.yml"]
    }
  }
}
```

### VSCode

Add this to your VSCode settings (`.vscode/settings.json`):

```json
{
  "mcp.servers": {
    "cipher": {
      "command": "docker",
      "args": ["exec", "-i", "cipher-mcp", "cipher", "--mode", "mcp", "--agent", "/app/cipher.yml"]
    }
  }
}
```

## Advanced Configuration

### Using Persistent Vector Store

To use Qdrant or ChromaDB instead of in-memory storage, modify the `memory` section in the Dockerfile's `cipher.yml`.

### Custom MCP Servers

Add additional MCP servers to the `mcpServers` section in `cipher.yml` inside the Dockerfile.

## Troubleshooting

### Check logs

```bash
# Ollama logs
docker logs cipher-ollama

# Cipher logs
docker logs cipher-mcp
```

### Restart services

```bash
docker-compose restart
```

### Clean restart

```bash
docker-compose down -v
docker-compose up -d
```

## Directory Structure

```
agent_toolkit/cipher/
├── Dockerfile           # Cipher MCP server image
├── docker-compose.yaml  # Orchestration for Cipher + Ollama
├── workspace/           # Local files accessible to Cipher
└── README.md           # This file
```

