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
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test borgmatic-runner`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
