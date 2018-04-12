class Lab < Formula
  desc "CLI tool for GitLab, like hub"
  homepage "https://github.com/zaquestion/lab"
  url "https://github.com/zaquestion/lab/releases/download/v0.10.1/lab_0.10.1_darwin_amd64.tar.gz"
  version "0.10.1"
  sha256 "7a215ca4b039403fd127edc02f6b9fdf58a044a3c925bd4d0e1666d8dfef977c"

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
