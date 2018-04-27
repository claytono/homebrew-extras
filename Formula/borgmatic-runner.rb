class BorgmaticRunner < Formula
  desc "Shell script to run borgmatic as a cron job"
  homepage "https://github.com/claytono/borgmatic-macos-runner"
  url "https://github.com/claytono/borgmatic-macos-runner.git"
  sha256 "348fecab3b37903880b8c617da5d9f8140a12cf5eb62bd8eaec295cb033df66f"

  depends_on "borgmatic"
  depends_on "terminal-notifier"

  def install
    bin.install "borgmatic-runner"
  end

  test do
    true
  end
end
