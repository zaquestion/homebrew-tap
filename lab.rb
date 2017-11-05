class Lab < Formula
  desc "CLI tool for GitLab, like hub"
  homepage "https://github.com/zaquestion/lab"
  url "https://github.com/zaquestion/lab.git",
      :tag => "v0.5.0",
      :revision => "5d3f274fbf89dfe8a4de3a26eb19a8a639df2f93"

  head "https://github.com/zaquestion/lab.git"

  depends_on "go" => :build
  depends_on "dep" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/zaquestion/lab"
    path.install buildpath.children
    cd path do
      system "dep", "ensure"
      system "go", "build", "-o", bin/"lab"
      prefix.install_metafiles
    end
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
