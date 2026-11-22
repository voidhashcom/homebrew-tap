class Voidhash < Formula
  desc "Manage your Voidhash projects from the terminal"
  homepage "https://voidhash.com/docs/cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/voidhashcom/voidhash/releases/download/cli-v0.2.1/voidhash_0.2.1_darwin_arm64.tar.gz"
      sha256 "77e714e6f22f08ce1c693bfb5a668bcf9ad53c0765d08ed4a7e978776be2878c"
    end
    on_intel do
      url "https://github.com/voidhashcom/voidhash/releases/download/cli-v0.2.1/voidhash_0.2.1_darwin_amd64.tar.gz"
      sha256 "dbc076dc16daa91d5c6d71ae328e440ec5f8284aa911e5eaede19152aa8cf8dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/voidhashcom/voidhash/releases/download/cli-v0.2.1/voidhash_0.2.1_linux_arm64.tar.gz"
      sha256 "41d3336afc90b173e9895f56316e8bc2e3d1da56e6f57e33d84a67b7cb1dd7b4"
    end
    on_intel do
      url "https://github.com/voidhashcom/voidhash/releases/download/cli-v0.2.1/voidhash_0.2.1_linux_amd64.tar.gz"
      sha256 "ce09583f3d8d6ea5757ad0390de1cd67bfdc52d727a6e13480cf6dcb81bb9b0d"
    end
  end

  def install
    # The CLI looks for its screen beside itself; only the CLI goes on PATH.
    libexec.install "voidhash", "voidhash-tui"
    bin.install_symlink libexec/"voidhash"
    bash_completion.install "completions/voidhash.bash" => "voidhash"
    zsh_completion.install "completions/_voidhash"
    fish_completion.install "completions/voidhash.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/voidhash --version")
  end
end
