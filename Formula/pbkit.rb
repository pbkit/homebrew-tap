class Pbkit < Formula
  desc "Protobuf toolings"
  homepage "https://github.com/pbkit/pbkit"
  url "https://api.github.com/repos/pbkit/pbkit/tarball/v0.0.56"
  sha256 "32997971f4080681cedfcea7471d164eac92ff7f66a0803ac610ace05e0aeed6"
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
