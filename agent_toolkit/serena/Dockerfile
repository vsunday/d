FROM python:3.12-slim

# Install uv, git, and Node.js
RUN pip install --no-cache-dir uv && apt-get update &&\
  apt-get install -y git nodejs npm && apt-get purge -y --auto-remove && rm -rf /var/lib/apt/lists/*

# Create workspace directory
WORKDIR /workspace

# Install Serena from GitHub using uv
RUN uv tool install --from git+https://github.com/oraios/serena serena-agent

# Add uv tools to PATH
ENV PATH="/root/.local/bin:${PATH}"

# Expose port for web dashboard (default: 8000)
EXPOSE 8000

# Start Serena MCP server in stdio mode
CMD ["uv", "run", "serena-agent", "start-mcp-server"]

