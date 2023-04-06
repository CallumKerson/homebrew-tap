# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Athenaeum < Formula
  desc ""
  homepage "https://github.com/CallumKerson/Athenaeum"
  version "1.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/CallumKerson/Athenaeum/releases/download/v1.11.0/athenaeum_1.11.0_darwin_arm64.tar.gz"
      sha256 "295d494a39050236a6a10c9acdd3c81d815240f051b66b27beee389d13514c77"

      def install
        bin.install "athenaeum"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CallumKerson/Athenaeum/releases/download/v1.11.0/athenaeum_1.11.0_darwin_amd64.tar.gz"
      sha256 "6443be3204adddc8825078cf8ffef2beadf541331d076d405add11879f543c1a"

      def install
        bin.install "athenaeum"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CallumKerson/Athenaeum/releases/download/v1.11.0/athenaeum_1.11.0_linux_arm64.tar.gz"
      sha256 "e70c071be3ccbbaff8ca052305cc8155551d8e91426718415981421e7997fd55"

      def install
        bin.install "athenaeum"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/CallumKerson/Athenaeum/releases/download/v1.11.0/athenaeum_1.11.0_linux_amd64.tar.gz"
      sha256 "3f413b69a5fb00bd42db873679c44cd1792c0a20d876641b20c537409a7567ba"

      def install
        bin.install "athenaeum"
      end
    end
  end

  def caveats
    <<~EOS
      ****************************************************************
      Below are services commands to run to manage the athenaeum service.
      If you wish to run the athenaeum at boot prefix these commands with sudo
      otherwise the service will run at login.
      To start the athenaeum service run:
        brew services start CallumKerson/homebrew-tap/athenaeum
      To stop the athenaeum service run:
        brew services stop CallumKerson/homebrew-tap/athenaeum
      To restart the athenaeum service run:
        brew services restart CallumKerson/homebrew-tap/athenaeum
      ****************************************************************
    EOS
  end

  service do
    run [opt_bin/"athenaeum", "run"]
    keep_alive true
    error_log_path var/"log/athenaeum.log"
    log_path var/"log/athenaeum.log"
  end

  test do
    system "#{bin}/athenaeum --version"
  end
end
