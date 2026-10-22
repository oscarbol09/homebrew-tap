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
  version "1.1.1"

  on_macos do
    on_arm do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-macos-aarch64.tar.gz"
      sha256 "20c793a87e1f9a26fd62b31f3453ab718f3c99e084a668f74eccaa94c8072438"
    end
    on_intel do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-macos-amd64.tar.gz"
      sha256 "0907eb35b268ad5e93e22f5051575bbd652b84d5373321515889884f87480636"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-linux-amd64.tar.gz"
      sha256 "bca6d78a5a0b017085a93f9d77e914b068f7889fe0a5bd849f6a907a9d1318d6"
    end
    on_arm do
      url "https://github.com/oscarbol09/jvm-mcp/releases/download/v#{version}/jvm-mcp-linux-aarch64.tar.gz"
      sha256 "0a05e302128fc34a24e21febc0373d4206117783c44d1561aff11d170087dc39"
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
