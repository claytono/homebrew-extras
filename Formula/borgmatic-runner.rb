class BorgmaticRunner < Formula
  desc "Shell script to run borgmatic as a cron job"
  homepage "https://github.com/claytono/borgmatic-macos-runner"
  url "https://github.com/claytono/borgmatic-macos-runner.git"
  sha256 "348fecab3b37903880b8c617da5d9f8140a12cf5eb62bd8eaec295cb033df66f"
  version "0.0.1"

  depends_on "borgmatic"
  depends_on "terminal-notifier"

  def install
    bin.install "borgmatic-runner"
  end

  test do
    true
  end
  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
                      <string>#{opt_bin}/borgmatic-runner</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>StartInterval</key>
              <integer>86400</integer>
      </dict>
      </plist>
    EOS
  end
end
