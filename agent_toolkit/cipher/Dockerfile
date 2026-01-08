# syntax=docker/dockerfile:1
# Dockerfile for Cipher MCP Server with Ollama
FROM node:24-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Cipher globally
RUN npm install -g @byterover/cipher

# Create working directory
WORKDIR /app

# Create cipher configuration file using COPY with heredoc (Docker official syntax)
COPY <<EOF /app/cipher.yml
# System Prompt - User customizable
systemPrompt: |
  You are an AI programming assistant focused on coding and reasoning tasks.
  You have access to persistent memory and can remember context across sessions.

# LLM Configuration - Using Ollama
llm:
  provider: ollama
  model: mistral:7b-instruct           # Optimized for memory management (4.4 GB)
  baseURL: http://ollama:11434/v1     # Ollama service hostname
  maxIterations: 50

# Evaluation LLM - for reflection and memory analysis
evalLlm:
  provider: ollama
  model: mistral:7b-instruct           # Strong reasoning for memory evaluation
  baseURL: http://ollama:11434/v1

# Embedding Configuration - Using Ollama
embedding:
  type: ollama
  model: nomic-embed-text              # Or mxbai-embed-large
  baseUrl: http://ollama:11434

# MCP Servers (optional - add other MCP servers if needed)
mcpServers:
  filesystem:
    type: stdio
    command: npx
    args:
      - -y
      - '@modelcontextprotocol/server-filesystem'
      - /workspace
    connectionMode: lenient
    timeout: 30000

# Session Configuration
sessions:
  maxSessions: 25
  sessionTTL: 7200000  # 2 hours

# Memory Configuration (optional)
memory:
  enabled: true
  vectorStore: in-memory  # Or configure Qdrant/Chroma for persistence
EOF

# Create workspace directory
RUN mkdir -p /workspace

# Expose port for HTTP transport (optional, if using SSE/HTTP mode)
EXPOSE 5000

# Start Cipher in MCP mode
CMD ["cipher", "--mode", "mcp", "--agent", "/app/cipher.yml"]

