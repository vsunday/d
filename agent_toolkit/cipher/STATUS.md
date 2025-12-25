# Cipher MCP Server Status

## ✅ System Status: OPERATIONAL

**Last Updated**: December 25, 2025

---

## Container Status

| Container | Status | Health | Notes |
|-----------|--------|--------|-------|
| **cipher-ollama** | Running | ✅ Healthy | Ollama service operational |
| **cipher-mcp** | Running | ⚠️ Unhealthy* | MCP server functional (health check for HTTP mode only) |

*The health check fails because Cipher runs in stdio MCP mode, not HTTP mode. The server is actually working correctly.

---

## Installed Models

### LLM Models

| Model | Size | Purpose | Status |
|-------|------|---------|--------|
| `mistral:7b-instruct` | 4.4 GB | Main LLM & Evaluation | ✅ Installed |
| `nomic-embed-text` | 274 MB | Embeddings | ✅ Installed |

**Total Size**: ~4.7 GB (vs 19 GB for qwen3:32b - **75% reduction**)

---

## Configuration Summary

### Optimized for Memory Management

The current configuration uses **Mistral 7B Instruct**, which is optimized for:
- ✅ **Text Summarization** - Creating concise memory entries
- ✅ **Reflection & Evaluation** - Analyzing what information is important
- ✅ **Context Understanding** - Relating memories across sessions
- ✅ **Fast Inference** - Quick background processing for memory operations

### Configuration Details

```yaml
# Main LLM
llm:
  provider: ollama
  model: mistral:7b-instruct
  baseURL: http://ollama:11434/v1
  maxIterations: 50

# Evaluation LLM (for reflection/analysis)
evalLlm:
  provider: ollama
  model: mistral:7b-instruct
  baseURL: http://ollama:11434/v1

# Embeddings (for semantic search)
embedding:
  type: ollama
  model: nomic-embed-text
  baseUrl: http://ollama:11434
```

---

## MCP Server Functionality

### ✅ Verified Working Components

1. **MCP Manager**: Initialized successfully
2. **Filesystem MCP Server**: Connected (access to `/workspace`)
3. **Vector Storage**: Dual collection system connected
   - Knowledge collection: ✅ Connected
   - Reflection collection: ✅ Connected
4. **Storage Backend**: 
   - In-memory cache: ✅ Connected
   - SQLite database: ✅ Connected

### MCP Tools Available

The Cipher MCP server provides the following capabilities:
- Memory storage and retrieval
- Reflection and reasoning analysis
- Context-aware interactions
- File system access through MCP

---

## Connection Instructions

### For Cursor IDE

Add to `~/.cursor/config.json`:

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

### For VSCode

Add to `.vscode/settings.json`:

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

---

## Resource Usage

### System Requirements

- **RAM**: ~6 GB recommended
- **Disk**: ~5 GB for models + data
- **CPU**: Works on CPU (no GPU required)

### Performance Characteristics

- **Startup Time**: ~30 seconds
- **Memory Operations**: Fast (optimized for summarization)
- **Inference Speed**: Medium-fast (7B parameter model)
- **Context Window**: 32K tokens

---

## Maintenance Commands

### Check Status

```bash
# View container status
docker ps

# Check Ollama models
docker exec cipher-ollama ollama list

# View Cipher logs
docker logs cipher-mcp

# View Ollama logs
docker logs cipher-ollama
```

### Restart Services

```bash
cd agent_toolkit/cipher

# Soft restart
docker-compose restart

# Full restart (clean)
docker-compose down
docker-compose up -d
```

### Pull Additional Models

```bash
# Example: Pull a different model
docker exec cipher-ollama ollama pull phi3:mini

# Check available models
docker exec cipher-ollama ollama list
```

---

## Troubleshooting

### Issue: Container shows "unhealthy"

**Status**: Normal behavior
**Reason**: Health check tries to connect to port 5000 (HTTP mode), but Cipher runs in stdio mode
**Impact**: None - MCP server functions correctly
**Solution**: Can be ignored, or health check can be removed from docker-compose.yaml

### Issue: Out of memory

**Solutions**:
1. Use lighter model: `phi3:mini` (2.3 GB)
2. Reduce maxIterations in cipher.yml
3. Increase Docker memory limit

### Issue: Models not found

**Solution**:
```bash
docker exec cipher-ollama ollama pull mistral:7b-instruct
docker exec cipher-ollama ollama pull nomic-embed-text
```

---

## Next Steps

### Optional Improvements

1. **Remove Health Check**: Since MCP mode doesn't use HTTP
   ```yaml
   # Remove from docker-compose.yaml
   # healthcheck: ...
   ```

2. **Add Persistent Vector Store**: For production use
   ```yaml
   vectorStore: qdrant  # or chroma
   ```

3. **Add More MCP Servers**: Extend functionality
   ```yaml
   mcpServers:
     github:
       type: stdio
       command: npx
       args: ["-y", "@modelcontextprotocol/server-github"]
   ```

---

## Performance Comparison

### Before: qwen3:32b
- Size: 19 GB
- RAM: 20+ GB required
- Inference: Slow
- Accuracy: Excellent

### After: mistral:7b-instruct
- Size: 4.4 GB (**77% smaller**)
- RAM: 6 GB required
- Inference: Fast
- Accuracy: Very Good (optimized for memory tasks)

**Result**: Better resource utilization with sufficient quality for memory management operations.

