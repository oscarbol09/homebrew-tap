# typed: false
# frozen_string_literal: true
#
# Homebrew Formula Template for JVM-MCP
# Note: This file serves as the distribution template. The version and SHA-256
# placeholders (REPLACE_WITH_*) are automatically calculated and synchronized
# by .github/workflows/release.yml when a GitHub release tag is published.
class JvmMcp < Formula
  desc "Native Java Model Context Protocol (MCP) server for live Spring Boot inspection"
  homepage "https://github.com/oscarbol09/jvm-mcp"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-macos-aarch64.tar.gz"
      sha256 "87a983b8bc87a529652248f840c32a23fc5b7c2fe81da7808cb2efb3b7aa12a1"
    end
    on_intel do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-macos-amd64.tar.gz"
      sha256 "938a0e7e01553ae921a3171c6f68b3293ab9b839e203a272d47b320a92faaab6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-linux-amd64.tar.gz"
      sha256 "41c5e9963c7847c9e90f8a96cb79547fdf4b6f8340f4edf3a6c80f4ba0b67311"
    end
    on_arm do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-linux-aarch64.tar.gz"
      sha256 "b27bffa516c89fbe9975c6534ddd31e5061889e7f0cb2cb6c0e8fd2954f4e75d"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"jvm-mcp"
  end

  test do
    system "#{bin}/jvm-mcp", "--version"
  end
end
