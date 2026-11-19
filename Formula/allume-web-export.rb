class AllumeWebExport < Formula
  desc "Publish Allume boards for the web"
  homepage "https://github.com/oktana-coop/allume-web-export"
  url "https://github.com/oktana-coop/allume-web-export/releases/download/v0.1.0/allume-web-export-0.1.0-macos.zip"
  sha256 "29dfbc9d47bc852e668440bcf05873f70788e1ae5d28cf6dc91fb4353bb20689"
  license "AGPL-3.0-or-later"

  depends_on macos: :sonoma

  # The binary finds its resource bundle beside it, so both go in libexec, with a link in bin.
  def install
    libexec.install "allume-web-export", "allume-web-export_AllumeWeb.bundle"
    bin.install_symlink libexec/"allume-web-export"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/allume-web-export --version").strip
  end
end
