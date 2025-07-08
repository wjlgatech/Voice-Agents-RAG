# Voice-Agents-RAG

A voice cloning integration project for Pipecat AI voice agent framework, leveraging multiple open-source repositories and voice cloning models.

## Quick Start

1. **Clone this repository**
   ```bash
   git clone [your-repo-url]
   cd Voice-Agents-RAG
   ```

2. **Run the setup script**
   ```bash
   ./setup.sh
   ```

   This will:
   - Clone all required GitHub repositories into `libs/`
   - Create Python virtual environment
   - Set up project structure
   - Create initial requirements.txt

3. **Activate virtual environment and install dependencies**
   ```bash
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```

## Project Structure

```
Voice-Agents-RAG/
├── src/                    # Main project source code
│   ├── voice_cloning/     # Voice cloning service implementation
│   └── examples/          # Example applications
├── libs/                  # External GitHub repositories (git-ignored)
│   ├── pipecat/          # AI voice agent framework
│   ├── anthropic-cookbook/ # Anthropic examples
│   ├── claudia/          # Claude Code session manager
│   ├── context-engineering-intro/ # Prompting techniques
│   ├── SuperClaude/      # Enhanced Claude configuration
│   └── RAG-Anything/     # Multi-modal RAG framework
├── tests/                 # Test suite
├── docs/                  # Additional documentation
└── voice_samples/         # User voice samples (git-ignored)
```

## External Repositories

This project uses the following GitHub repositories:

- **[Pipecat](https://github.com/pipecat-ai/pipecat)** - Core AI voice agent framework
- **[Anthropic Cookbook](https://github.com/anthropics/anthropic-cookbook)** - Claude usage examples
- **[Claudia](https://github.com/getAsterisk/claudia)** - Desktop app for Claude Code
- **[Context Engineering Intro](https://github.com/coleam00/context-engineering-intro)** - Advanced prompting
- **[SuperClaude](https://github.com/NomenAK/SuperClaude)** - Enhanced Claude configuration and rules
- **[RAG-Anything](https://github.com/HKUDS/RAG-Anything)** - Multi-modal RAG framework

## Development

See [CLAUDE.md](./CLAUDE.md) for detailed development guidance and architecture information.

## Voice Cloning Models

The project supports integration with:
- OpenVoice (zero-shot cloning)
- Coqui XTTS
- Bark (emotion control)
- F5-TTS (high quality)

## Documentation

- [Implementation Guide](./Adding%20Voice%20Cloning%20to%20Pipecat_%20Implementation%20Gu.md) - Detailed voice cloning implementation
- [CLAUDE.md](./CLAUDE.md) - Development guidance for Claude Code