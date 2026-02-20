$env.PATH = ($env.PATH | split row (char esep) | prepend [
	"/opt/homebrew/bin"
	"/opt/homebrew/sbin"
	"/Users/yamiteru/.local/bin"
	"/Users/yamiteru/.config/bin"
	"/Users/yamiteru/.grit/bin"
	"/Users/yamiteru/.cargo/bin"
	"/Users/yamiteru/.bun/bin"
	"/Users/yamiteru/.gcloud/bin"
	"/Users/yamiteru/.lmstudio/bin"
	"/Users/yamiteru/.opencode/bin"
	"/Users/yamiteru/.codeium/windsurf/bin"
	"/Users/yamiteru/.antigravity/antigravity/bin"
	"/Users/yamiteru/Library/Android/sdk/platform-tools"
	"/Users/yamiteru/Library/Android/sdk/cmdline-tools/latest/bin"
	"/Users/yamiteru/Library/Application Support/JetBrains/Toolbox/scripts"
	"/usr/local/bin"
	"/usr/bin"
] | uniq)

$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"
$env.HOMEBREW_REPOSITORY = "/opt/homebrew"

$env.ANDROID_HOME = "/Users/yamiteru/Library/Android/sdk"
$env.ANDROID_NDK_HOME = $"($env.ANDROID_HOME)/ndk/27.0.12077973"

$env.AWS_DEFAULT_REGION = "us-east-1"
$env.AWS_PROFILE = "yamiteru"
