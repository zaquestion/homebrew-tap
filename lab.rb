class Lab < Formula
  desc "CLI tool for GitLab, like hub"
  homepage "https://github.com/zaquestion/lab"
  url "https://github.com/zaquestion/lab/releases/download/v0.9.1/lab_0.9.1_darwin_amd64.tar.gz"
  version "0.9.1"
  sha256 "f06ee02fa4195fb39b0a1ed254ec568d48981c72ae3fffb6046225db55735273"

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
