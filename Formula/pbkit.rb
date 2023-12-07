class Pbkit < Formula
  desc "Protobuf toolings"
  homepage "https://github.com/pbkit/pbkit"
  url "https://api.github.com/repos/pbkit/pbkit/tarball/v0.0.63"
  sha256 "7ae4d112aebfb21da3eab70b0e04c22b11c043192d0a28628b0859835a2075e0"
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
