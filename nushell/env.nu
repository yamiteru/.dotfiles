$env.PATH = ($env.PATH | split row (char esep) | prepend [
	"/opt/homebrew/bin"
	"/opt/homebrew/sbin"
	"/Users/yamiteru/.local/bin",
	"/Users/yamiteru/.config/bin",
	"/Users/yamiteru/.grit/bin",
	"/Users/yamiteru/.cargo/bin",
	"/usr/local/bin"
	"/usr/bin"
] | uniq)
