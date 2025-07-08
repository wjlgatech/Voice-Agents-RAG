#!/bin/bash

# Voice-Agents-RAG Setup Script
# This script clones and sets up all required repositories

echo "Setting up Voice-Agents-RAG project with multiple repositories..."

# Create libs directory for external repositories
mkdir -p libs

# Clone repositories if they don't exist
echo "Cloning required repositories..."

# Pipecat - AI voice agent framework
if [ ! -d "libs/pipecat" ]; then
    echo "Cloning pipecat..."
    git clone https://github.com/pipecat-ai/pipecat.git libs/pipecat
else
    echo "pipecat already exists, pulling latest..."
    cd libs/pipecat && git pull && cd ../..
fi

# Anthropic Cookbook - Examples and patterns
if [ ! -d "libs/anthropic-cookbook" ]; then
    echo "Cloning anthropic-cookbook..."
    git clone https://github.com/anthropics/anthropic-cookbook.git libs/anthropic-cookbook
else
    echo "anthropic-cookbook already exists, pulling latest..."
    cd libs/anthropic-cookbook && git pull && cd ../..
fi

# Claudia - Desktop app for Claude Code session management
if [ ! -d "libs/claudia" ]; then
    echo "Cloning claudia..."
    git clone https://github.com/getAsterisk/claudia.git libs/claudia
else
    echo "claudia already exists, pulling latest..."
    cd libs/claudia && git pull && cd ../..
fi

# Context Engineering Intro - Advanced prompting techniques
if [ ! -d "libs/context-engineering-intro" ]; then
    echo "Cloning context-engineering-intro..."
    git clone https://github.com/coleam00/context-engineering-intro.git libs/context-engineering-intro
else
    echo "context-engineering-intro already exists, pulling latest..."
    cd libs/context-engineering-intro && git pull && cd ../..
fi

# SuperClaude - Enhanced Claude configuration and rules
if [ ! -d "libs/SuperClaude" ]; then
    echo "Cloning SuperClaude..."
    git clone https://github.com/NomenAK/SuperClaude.git libs/SuperClaude
else
    echo "SuperClaude already exists, pulling latest..."
    cd libs/SuperClaude && git pull && cd ../..
fi

# RAG-Anything - Multi-modal RAG framework
if [ ! -d "libs/RAG-Anything" ]; then
    echo "Cloning RAG-Anything..."
    git clone https://github.com/HKUDS/RAG-Anything.git libs/RAG-Anything
else
    echo "RAG-Anything already exists, pulling latest..."
    cd libs/RAG-Anything && git pull && cd ../..
fi

# Create Python virtual environment
echo "Setting up Python virtual environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Install pipecat as a development dependency
echo "Installing pipecat in development mode..."
pip install -e ./libs/pipecat

# Create project structure
echo "Creating project structure..."
mkdir -p src/voice_cloning
mkdir -p src/examples
mkdir -p tests
mkdir -p docs
mkdir -p voice_samples

# Create basic requirements.txt
if [ ! -f "requirements.txt" ]; then
    echo "Creating requirements.txt..."
    cat > requirements.txt << EOL
# Core dependencies
pipecat-ai>=0.1.0
anthropic>=0.18.0
openai>=1.0.0
python-dotenv>=1.0.0

# Voice cloning models
TTS>=0.22.0  # Coqui TTS
openvoice>=0.1.0

# Audio processing
numpy>=1.24.0
scipy>=1.10.0
librosa>=0.10.0

# Web and API
fastapi>=0.100.0
uvicorn>=0.23.0
websockets>=11.0

# Testing
pytest>=7.4.0
pytest-asyncio>=0.21.0

# Development
black>=23.0.0
flake8>=6.0.0
mypy>=1.0.0
EOL
fi

echo "Setup complete! Next steps:"
echo "1. Activate the virtual environment: source venv/bin/activate"
echo "2. Install additional dependencies: pip install -r requirements.txt"
echo "3. Check the libs/ directory for cloned repositories"
echo "4. Start developing your voice cloning integration!"