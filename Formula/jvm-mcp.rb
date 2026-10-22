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
      sha256 "85296cb284d388d9059c8bd76cb1de09a361982ae06e894288dcf9ad45983deb"
    end
    on_intel do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-macos-amd64.tar.gz"
      sha256 "bf874851aa9f90c949491cb0fb150b1230aa1cd23a3431aa9ac4924e525731f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-linux-amd64.tar.gz"
      sha256 "8f93c23cd83af05092bae12abfa2f4a170d458c3ab96410cdb40093d76182311"
    end
    on_arm do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-linux-aarch64.tar.gz"
      sha256 "745da688b1e713607f81c1c8578914e0af3b319999f7de5183d66c6f4078a22d"
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
