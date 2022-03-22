class Pbkit < Formula
  desc "Protobuf toolings"
  homepage "https://github.com/pbkit/pbkit"
  url "https://github.com/pbkit/pbkit/archive/v0.0.42.tar.gz"
  sha256 "2d4be005e9f917d8b131338a88e169eec52f5a8ed391e94025e584f35a1fcbce"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "pb", "-A", "--unstable", libexec/"cli/pb/entrypoint.ts"
    system "deno", "install", "--root", libexec, "-n", "pollapo", "-A", "--unstable", libexec/"cli/pollapo/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
