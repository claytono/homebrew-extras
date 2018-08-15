class Borgmatic < Formula
  include Language::Python::Virtualenv

  desc "Wrapper for the Borg backup software that creates and prunes backups"
  homepage "https://torsion.org/borgmatic/"
  url "https://files.pythonhosted.org/packages/71/aa/ada5c52eda4083d2b572b338efe8d767d7c516dd0444739d6cc0cef24ace/borgmatic-1.2.2.tar.gz"
  sha256 "3d3079f84b2f4e13f7052c109adae358ef3383405e028aa6d3bbb698240de2af"

  depends_on "python"

  resource "docopt" do
    url "https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz"
    sha256 "49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491"
  end

  resource "pykwalify" do
    url "https://files.pythonhosted.org/packages/c9/43/84d3b52161d27f7168c5870c79b97255f9d01c4b259bf32ca42dd39c21f0/pykwalify-1.6.1.tar.gz"
    sha256 "191fd3f457f23c0aa8538c3a5c0249f70eeb1046e88d0eaaef928e09c44dff8d"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz"
    sha256 "e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz"
    sha256 "3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf"
  end

  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/94/c9/dac4209ac5d1b08ce7943cf5b8597eb41322145aa9a52f7aef2474bee1f9/ruamel.yaml-0.15.55.tar.gz"
    sha256 "bc2a096c34e33169fc65d63c2e1f1f0bfa461187d9ad2efc8c06857322b5cf1c"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  def install
    inreplace "borgmatic/borg/create.py", "'--info',", "'--info', '--progress',"
    virtualenv_install_with_resources
  end

  test do
    system bin/"generate-borgmatic-config", "-d", "test.config"
    assert_predicate testpath/"test.config", :exist?

    msg = shell_output("#{bin}/borgmatic --help")
    assert_match "usage: borgmatic", msg
  end
end
