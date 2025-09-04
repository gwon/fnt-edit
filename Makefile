# Tauri + Svelte Makefile

.PHONY: help dev build clean install test preview

# Default target
help:
	@echo "Available commands:"
	@echo "  make dev      - Run development server (cargo tauri dev)"
	@echo "  make build    - Build for production (cargo tauri build)"
	@echo "  make clean    - Clean build artifacts (cargo clean)"
	@echo "  make install  - Install dependencies (npm install)"
	@echo "  make test     - Run tests"
	@echo "  make preview  - Preview production build"

# Development
dev:
	@echo "Starting Tauri development server..."
	cargo tauri dev

# Build for production
build:
	@echo "Building for production..."
	cargo tauri build

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	cd src-tauri; cargo clean

clean-all:
	@echo "Cleaning build artifacts..."
	cd src-tauri; cargo clean
	@echo "Cleaning node_modules..."
	rm -rf node_modules
	@echo "Cleaning dist..."
	rm -rf dist

# Install dependencies
install:
	@echo "Installing npm dependencies..."
	npm install
	@echo "Installing Rust dependencies..."
	cd src-tauri; cargo build

# Run tests
test:
	@echo "Running tests..."
	npm run test

# Preview production build
preview:
	@echo "Starting preview server..."
	npm run preview

# Quick setup (install + dev)
setup: install dev
