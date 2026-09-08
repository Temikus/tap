class Fx < Formula
  desc "Tiny, open, embeddable, native coding agent"
  homepage "https://github.com/vercel-labs/fx"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/vercel-labs/fx/archive/refs/tags/v0.0.7.tar.gz"
      sha256 "bcbf3850b8e3ebcc1e8728104eec76242dd43399fe0c08b625887b2a6673427f"
    end
    on_intel do
      url "https://github.com/vercel-labs/fx/releases/download/v0.0.8/fx-macos-x86_64.tar.gz"
      sha256 "1d054613d6605cb6e25c6627cc85e7e380f5eee9e7c8c52e7d707b387d8830a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vercel-labs/fx/releases/download/v0.0.8/fx-linux-aarch64.tar.gz"
      sha256 "8b2ee30fdaad4f6c716aef514d629cba1a0ccff352e55891bd31e7ab870d15ca"
    end
    on_intel do
      url "https://github.com/vercel-labs/fx/releases/download/v0.0.8/fx-linux-x86_64.tar.gz"
      sha256 "5a2a5e188381c7f63d4d9b705bc5968e9d5cb94e1fad696dcae988474e00d124"
    end
  end

  def install
    bin.install "fx"
    prefix.install "LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fx --version").strip
    assert_match "coding agent", shell_output("#{bin}/fx --help")
  end
end
