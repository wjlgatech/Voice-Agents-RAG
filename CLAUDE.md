# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a voice cloning integration project for Pipecat, an AI voice agent framework. The project uses multiple GitHub repositories as dependencies and references, organized in a modular structure.

### Repository Structure
```
Voice-Agents-RAG/
├── src/                    # Main project source code
│   ├── voice_cloning/     # Voice cloning service implementation
│   └── examples/          # Example applications
├── libs/                  # External GitHub repositories (git-ignored)
│   ├── pipecat/          # Pipecat AI voice agent framework
│   ├── anthropic-cookbook/ # Anthropic examples and patterns
│   ├── claudia/          # Desktop app for Claude Code sessions
│   ├── context-engineering-intro/ # Advanced prompting techniques
│   ├── SuperClaude/      # Enhanced Claude configuration and rules
│   └── RAG-Anything/     # Multi-modal RAG framework
├── tests/                 # Test suite
├── docs/                  # Additional documentation
├── voice_samples/         # User voice samples (git-ignored)
└── setup.sh              # Repository setup script
```

## Project Architecture (Planned)

### Core Components
- **Voice Cloning Service**: Custom TTS service implementing voice cloning capabilities
- **Voice Sample Manager**: System for capturing and managing user voice samples
- **Pipeline Integration**: Integration with Pipecat's modular pipeline architecture
- **Multi-user Support**: Voice profile management for multiple users

### Technology Stack
- **Language**: Python
- **Framework**: Pipecat (AI voice agent framework)
- **Voice Cloning Models**: 
  - OpenVoice (zero-shot cloning)
  - Coqui XTTS (already partially supported in Pipecat)
  - Bark (emotion control)
  - F5-TTS (high quality)
- **Transport**: WebRTC via Daily.co
- **Audio**: Real-time streaming with 24kHz sample rate

## Development Commands

### Initial Setup
```bash
# Clone and set up all repositories
./setup.sh

# Or manually clone specific repositories
git clone https://github.com/pipecat-ai/pipecat.git libs/pipecat
git clone https://github.com/anthropics/anthropic-cookbook.git libs/anthropic-cookbook
git clone https://github.com/getAsterisk/claudia.git libs/claudia
git clone https://github.com/coleam00/context-engineering-intro.git libs/context-engineering-intro
git clone https://github.com/NomenAK/SuperClaude.git libs/SuperClaude
git clone https://github.com/HKUDS/RAG-Anything.git libs/RAG-Anything
```

### Development Workflow

```bash
# Environment setup (once implemented)
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt

# Running the application (planned structure)
python main.py  # Main application entry point
python -m voice_cloning.service  # Run voice cloning service

# Testing (when implemented)
pytest tests/
pytest tests/voice_cloning/  # Test voice cloning components
pytest -v  # Verbose output
```

## Code Architecture

### Pipecat Integration Pattern
The voice cloning service should follow Pipecat's standardized TTS service interface:

```python
from pipecat.services.tts_service import TTSService
from pipecat.frames.frames import AudioRawFrame, TTSStartedFrame, TTSStoppedFrame

class VoiceCloningTTSService(TTSService):
    async def run_tts(self, text: str) -> AsyncGenerator[AudioRawFrame, None]:
        # Implementation here
```

### Pipeline Structure
Voice cloning integrates into Pipecat's modular pipeline:
- `transport.input()` → STT → Context Aggregator → LLM → **Voice Cloning TTS** → Context Aggregator → `transport.output()`

### Key Implementation Areas
1. **Custom TTS Service**: Extend `TTSService` base class
2. **Voice Model Management**: Cache and manage voice models for different users
3. **Audio Processing**: Handle 24kHz mono audio frames
4. **Real-time Adaptation**: Support dynamic voice switching

## Implementation Roadmap

1. **Phase 1**: Set up Python project structure
   - Create source directories (`src/voice_cloning/`)
   - Define dependencies in `requirements.txt`
   - Set up development environment

2. **Phase 2**: Implement core voice cloning service
   - Create `VoiceCloningTTSService` class
   - Integrate chosen voice cloning model (start with XTTS)
   - Implement audio frame generation

3. **Phase 3**: Add voice management
   - Build `VoiceSampleManager` for user voice samples
   - Implement voice sample capture and storage
   - Add multi-user voice profile support

4. **Phase 4**: Pipeline integration
   - Create example applications
   - Test with Pipecat's WebRTC transport
   - Add error handling and logging

## External Repositories

This project leverages several GitHub repositories stored in the `libs/` directory:

### Pipecat (`libs/pipecat/`)
- Core AI voice agent framework
- Provides modular pipeline architecture
- Includes TTS/STT service interfaces
- WebRTC transport via Daily.co
- Reference: https://github.com/pipecat-ai/pipecat

### Anthropic Cookbook (`libs/anthropic-cookbook/`)
- Examples and best practices for using Claude
- Patterns for AI agent development
- Code examples for various use cases
- Reference: https://github.com/anthropics/anthropic-cookbook

### Claudia (`libs/claudia/`)
- Desktop application for Claude Code session management
- Built with Tauri 2 + React
- Useful for understanding session management patterns
- Reference: https://github.com/getAsterisk/claudia

### Context Engineering Intro (`libs/context-engineering-intro/`)
- Advanced prompting techniques
- Context management strategies
- Useful for optimizing AI agent interactions
- Reference: https://github.com/coleam00/context-engineering-intro

### SuperClaude (`libs/SuperClaude/`)
- Enhanced Claude configuration and rules
- Optimized prompting patterns
- Performance and efficiency improvements
- Advanced Claude customization strategies
- Reference: https://github.com/NomenAK/SuperClaude

### RAG-Anything (`libs/RAG-Anything/`)
- Multi-modal RAG (Retrieval-Augmented Generation) framework
- Supports various data modalities (text, images, audio, video)
- Advanced retrieval and generation pipelines
- Useful for building context-aware voice agents
- Reference: https://github.com/HKUDS/RAG-Anything

## Working with External Repositories

```bash
# Access Pipecat examples
cd libs/pipecat/examples

# Run Anthropic cookbook examples
cd libs/anthropic-cookbook
python [example_file].py

# Build and run Claudia locally
cd libs/claudia
bun install && bun run tauri dev

# Study context engineering patterns
cd libs/context-engineering-intro

# Explore SuperClaude configurations
cd libs/SuperClaude

# Study RAG-Anything framework
cd libs/RAG-Anything
python examples/[example_name].py
```

## Important Notes

- The implementation guide (`Adding Voice Cloning to Pipecat_ Implementation Gu.md`) contains detailed code examples and architecture decisions
- Pipecat uses async/await patterns throughout - maintain consistency
- Audio frames should be 24kHz, mono channel for compatibility
- Consider GPU acceleration for voice cloning models in production
- Cache voice models to reduce latency for frequently used voices
- External repositories in `libs/` are git-ignored to maintain clean version control