require "language/php"

class MysqlSearchReplace < Formula
  include Language::PHP::Shebang

  desc "Database search and replace script in PHP"
  homepage "https://interconnectit.com/products/search-and-replace-for-wordpress-databases/"
  url "https://github.com/interconnectit/Search-Replace-DB/archive/refs/tags/4.1.4.tar.gz"
  sha256 "f753d8d70994abce3b5d72b5eac590cb2116b8b44d4fe01d4c3b41d57dd6c13d"
  license "GPL-3.0-or-later"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "08b03d69eae7a4b2f89ead89f79ac09cd0bd093da29e0255329c308fd559ff43"
  end

  depends_on "php"

  def install
    libexec.install "srdb.class.php"
    libexec.install "srdb.cli.php" => "srdb"
    rewrite_shebang detected_php_shebang, libexec/"srdb" if OS.linux?
    bin.write_exec_script libexec/"srdb"
  end

  test do
    system bin/"srdb", "--help"
  end
end
