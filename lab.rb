# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Lab < Formula
  desc "Interacts with GitLab repositories creating/editing merge requests, issues, milestones, snippets and CI pipelines."
  homepage "https://github.com/zaquestion/lab"
  version "0.25.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zaquestion/lab/releases/download/v0.25.1/lab_0.25.1_darwin_arm64.tar.gz"
      sha256 "de88f2d279f48141e14edd0488689e5a173549a5b40f117f995eba2f04dc0fc0"

      def install
        bin.install "lab"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/zaquestion/lab/releases/download/v0.25.1/lab_0.25.1_darwin_amd64.tar.gz"
      sha256 "32e9a612140ec375ab20092e2f7d64d63ba28fac76d48bc2ff1ecbf6f8698585"

      def install
        bin.install "lab"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/zaquestion/lab/releases/download/v0.25.1/lab_0.25.1_linux_amd64.tar.gz"
      sha256 "0476a5b5406cdb1c0e224463702225588a2ca74bf236d0b93f7985d304efea91"

      def install
        bin.install "lab"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/zaquestion/lab/releases/download/v0.25.1/lab_0.25.1_linux_arm64.tar.gz"
      sha256 "0accfc5acca5c8e2e75b456d918ac25c641bd47b3c866c1df417ad383333cb32"

      def install
        bin.install "lab"
      end
    end
  end

  test do
    lab_new_version = "lab version 0.25.1"
    assert_match lab_new_version, shell_output("#{bin}/lab --version").strip
  end
end
