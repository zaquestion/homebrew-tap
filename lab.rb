# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Lab < Formula
  desc "Interacts with GitLab repositories creating/editing merge requests, issues, milestones, snippets and CI pipelines."
  homepage "https://github.com/zaquestion/lab"
  version "0.25.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zaquestion/lab/releases/download/v0.25.0/lab_0.25.0_darwin_arm64.tar.gz"
      sha256 "86d57e798c914f9aee4d9590f96c942802c28a4f8c7993457f858be05784b2d7"

      def install
        bin.install "lab"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/zaquestion/lab/releases/download/v0.25.0/lab_0.25.0_darwin_amd64.tar.gz"
      sha256 "377b4c3ec7f11f1a06fa93cd94187c4a593e9f1febb4f01033b15bfe34fbcf24"

      def install
        bin.install "lab"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zaquestion/lab/releases/download/v0.25.0/lab_0.25.0_linux_amd64.tar.gz"
      sha256 "faa212c6173e9370400be49cd265b5193f497559656a71843f3484b55e21359f"

      def install
        bin.install "lab"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zaquestion/lab/releases/download/v0.25.0/lab_0.25.0_linux_arm64.tar.gz"
      sha256 "d9e65e26b0b30074bb1164e01b693a76ad67dc34b697f4caa27ba1992329c280"

      def install
        bin.install "lab"
      end
    end
  end

  test do
    lab_new_version = "lab version 0.25.0"
    assert_match lab_new_version, shell_output("#{bin}/lab --version").strip
  end
end
