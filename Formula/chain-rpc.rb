class ChainRpc < Formula
  desc "Fast CLI tool for finding public RPC endpoints for blockchain networks"
  homepage "https://github.com/nksazonov/chain-rpc"
  url "https://github.com/nksazonov/chain-rpc/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "0ca417edc299bd36de759d48ebbdb5383679d5d0182c78732ab667ec4331e1a1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    # Test version command
    assert_match "0.1.2", shell_output("#{bin}/chain-rpc version")

    # Test help command
    assert_match "Find first working RPC endpoint", shell_output("#{bin}/chain-rpc --help")

    # Test cache management
    system "#{bin}/chain-rpc", "cache", "clean"
  end
end
