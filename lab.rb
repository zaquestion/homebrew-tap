class Lab < Formula
  desc "CLI tool for GitLab, like hub"
  homepage "https://github.com/zaquestion/lab"
  url "https://github.com/zaquestion/lab/releases/download/v0.9.0/lab_0.9.0_darwin_amd64.tar.gz"
  version "0.9.0"
  sha256 "ef649de06b32f079ae64c346533f09e93d8869b21023074bb8933afd3b10ea0c"

  def install
    bin.install "lab"
  end

  test do
    system "git", "init"
    %w[haunted house].each { |f| touch testpath/f }
    system "git", "add", "haunted", "house"
    system "git", "commit", "-a", "-m", "Initial Commit"
    system "git", "config", "--local", "--add", "gitlab.host", "http://example.com"
    system "git", "config", "--local", "--add", "gitlab.user", "test"
    system "git", "config", "--local", "--add", "gitlab.token", "test"
    assert_equal "haunted\nhouse", shell_output("#{bin}/lab ls-files").strip
  end
end
