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
      sha256 "7bd6d843a6ce8d385f2721945d114c68ba6af26b6947bf4c3c38e61a4c9fe432"
    end
    on_intel do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-macos-amd64.tar.gz"
      sha256 "66a09abcb5a4493d3fc1ea1bb83e235988038fbbe72bc57f1e65970eff47d6d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-linux-amd64.tar.gz"
      sha256 "0e82242a2e277fd2a14d538fa95a4990f8b5a5a95f2cb68e4c56753b8cdfb914"
    end
    on_arm do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-linux-aarch64.tar.gz"
      sha256 "6b30c8252a5c8e1fff3411faf98a11879682eb7321688e9c424db34484ee2182"
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
