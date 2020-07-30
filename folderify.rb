class Folderify < Formula
  include Language::Python::Virtualenv

  desc "Generate pretty, beveled macOS folder icons"
  homepage "https://github.com/lgarron/folderify"
  url "https://github.com/lgarron/folderify/archive/v1.2.3.tar.gz"
  sha256 "3a9eaadf1f2a9dde3ab58bb07ea5b1a5f5a182f62fe19e2cd79a88f6abe00f7e"
  license "MIT"

  depends_on "imagemagick"
  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    # Downloads a test icon
    system "curl", "https://raw.githubusercontent.com/lgarron/folderify/main/examples/src/apple.png",
           "-o", "apple.png"
    # Foldify applies the test icon to a folder
    system "folderify", "apple.png", testpath.to_s
    # Tests for the presence of the file icon
    assert_predicate testpath / "Icon\r", :exist?
  end
end
