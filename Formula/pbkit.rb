class Pbkit < Formula
  desc "Protobuf toolings"
  homepage "https://github.com/pbkit/pbkit"
  url "https://github.com/pbkit/pbkit/archive/v0.0.47.tar.gz"
  sha256 "e3be7bf7ed9f7cb1d2b38bff211276ef617e9c0cef06a48255bd7bf497c04fe8"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "pb", "-A", "--no-check", "--unstable", libexec/"cli/pb/entrypoint.ts"
    system "deno", "install", "--root", libexec, "-n", "pollapo", "-A", "--no-check", "--unstable", libexec/"cli/pollapo/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
