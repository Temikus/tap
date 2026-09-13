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
      url "https://github.com/vercel-labs/fx/releases/download/v0.0.9/fx-macos-x86_64.tar.gz"
      sha256 "4444e41a2c4c63fc499c6f901ba761092937e442be8b200e131f4913e559a31e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vercel-labs/fx/releases/download/v0.0.9/fx-linux-aarch64.tar.gz"
      sha256 "741eb64e832d168309025fb9e84a0ccb1b842043d796f18898ed06c65d83a498"
    end
    on_intel do
      url "https://github.com/vercel-labs/fx/releases/download/v0.0.9/fx-linux-x86_64.tar.gz"
      sha256 "710069648015f37f68123adc6f9f6137d7075681fb7a0881e251c1b9fe860a85"
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
