class Lab < Formula
  desc "Lab wraps Git or Hub, making it simple to clone, fork, and interact with repositories on GitLab"
  homepage "https://github.com/zaquestion/lab"
  url "https://github.com/zaquestion/lab/releases/download/v0.13.1/lab_0.13.1_darwin_amd64.tar.gz"
  version "0.13.1"
  sha256 "2b98fefa22eb27f3e2032e454a51e5e6ab2bc7736f67db66d8c8806244e48554"

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
