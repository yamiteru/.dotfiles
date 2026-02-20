# Neovim Configuration Guidelines for AI Agents

This document defines the core philosophy and strict rules for modifying this Neovim configuration (`init.lua`). The user has severe ADHD and optimizes heavily for **minimalism, zero visual noise, and strict single-tasking**.
Any AI agent modifying this configuration MUST adhere to these principles.

## 1. Core Philosophy: The Hermetically Sealed Box
- **Zero Distractions**: The editor must remain as visually quiet as possible. Do not add random floating windows, slide-out panels, or complex UI elements unless absolutely necessary.
- **No Multitasking in Neovim**: The user relies on external tools (Ghostty tabs, tmux, yabai) for multiplexing. Do NOT add terminal management plugins (e.g., toggleterm) or complex window split management tools.
- **Center-Focused Reading**: The user uses `no-neck-pain.nvim` to lock text to a maximum width (100 columns) in the dead center of the monitor. Do not introduce wide elements that break this centering, except for transient, full-screen tools (like DAP UI).

## 2. Visual Aesthetics & UI Chrome
- **Hidden by Default**: Statuslines (`laststatus = 0`), line numbers, mode indicators, and command bars are disabled by default. Do not re-enable them.
- **Animations**: Extreme animations create visual stutters that break focus. The editor relies on the inherent scrolling behavior of the terminal emulator without adding artificial smooth-scrolling plugins. Avoid complex visual smears or bouncing effects.
- **Prompts**: Command-line prompts are intercepted by `dressing.nvim` to appear as clean, centered floating windows.
- **Syntax and Code Distractions**: The scrollbar (`nvim-scrollview`) is intentional for anchoring. Markdown rendering (`render-markdown.nvim`) hides raw syntax characters.

## 3. Tooling & Workflows
- **Git**: The user manages git externally via a terminal multiplexer (e.g., Ghostty tabs or tmux) using Lazygit. Do not install floating terminal wrappers or git plugins inside Neovim. Merge conflicts are handled visually inline via `git-conflict.nvim`.
- **Global Search & Replace**: Use `grug-far.nvim`. Do NOT install `spectre` (too much UI chrome).
- **File Explorer**: Use `oil.nvim`. It treats the filesystem like a text buffer. Do NOT install side-panel explorers like `nvim-tree` or `neo-tree`.
- **Testing**: Use `neotest` (with Bun and Playwright adapters) manually triggered via keybinds. Auto-discovery must remain disabled to prevent performance hits on large monorepos.
- **Daily Notes**: Routed through `obsidian.nvim` directly to `/Users/yamiteru/dev/vault-private/daily`.
- **Debugging**: `nvim-dap` is the standard. Its UI must auto-open on initialization and cleanly tear down on exit.

## 4. Artificial Intelligence
- **STRICT RULE**: Do **NOT** install AI plugins (Copilot, Avante, Codeium, ChatGPT, etc.) inside Neovim. The user uses Claude Code exclusively in an external terminal window. No AI chatbots belong inside the editor.

## 5. Keybinding Guidelines
- Keep prefixes logical.
- **`<leader>`** is Space.
- **`<localleader>`** is Space.
- Do not use function keys (`<F1>`-`<F12>`). The user's keyboard does not have them. Map complex toolings to logical prefix chords (e.g., `<leader>b` for breakpoints/debugging tools).
