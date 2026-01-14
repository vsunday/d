# MCP add commands
```
claude mcp add --transport stdio --scope user context7 -- docker exec -i context7-mcp context7-mcp
claude mcp add --transport stdio --scope user cipher -- docker exec -i cipher-mcp cipher --mode mcp
claude mcp add --transport stdio --scope user serena -- docker exec -i serena-mcp serena start-mcp-server
```