class ChainRpc < Formula
  desc "Fast CLI tool for finding public RPC endpoints for blockchain networks"
  homepage "https://github.com/nksazonov/chain-rpc"
  url "https://github.com/nksazonov/chain-rpc/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6c2dd6bf338901ff87c32eeb411090917a2ad65d0e85c4dfba40c72d9006b0ff"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./..."
  end

  test do
    # Test version command
    assert_match "0.1.0", shell_output("#{bin}/chain-rpc version")

    # Test help command
    assert_match "Find first working RPC endpoint", shell_output("#{bin}/chain-rpc --help")

    # Test cache management
    system "#{bin}/chain-rpc", "cache", "clean"
  end
end
