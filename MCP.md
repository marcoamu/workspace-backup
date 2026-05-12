# MCP Servers Configuration

## Available MCPs for MiMultiMax Agents

### 1. PostgreSQL MCP
Database access for all agents
- Package: @anthropic-ai/mcp-postgres
- Config: Connect to knowledge_base

### 2. Filesystem MCP  
Code file access
- Package: @anthropic-ai/mcp-filesystem
- Config: Access to /root/.openclaw/workspace

### 3. Brave Search MCP
Web research capability
- Package: @anthropic-ai/mcp-brave-search
- API Key needed

### 4. GitHub MCP
Repository management
- Package: @anthropic-ai/mcp-github
- Token needed

## Integration

Each agent skill now includes MCP tool references for enhanced capabilities.
