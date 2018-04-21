class Borgmatic < Formula
  include Language::Python::Virtualenv

  desc "Wrapper for the Borg backup software that creates and prunes backups"
  homepage "https://torsion.org/borgmatic/"
  url "https://files.pythonhosted.org/packages/66/26/36f96dc82efa3a9a6bc0b97fff4343dc27a7ac984c4efda79cf223f16f81/borgmatic-1.1.15.tar.gz"
  sha256 "4592092cb238905a233fdc01d0f87a5e613e02413ea93091a4dba1cdbcc13b5f"

  depends_on "python"

  bottle do
    cellar :any
    sha256 "9c918b792e373ab00c3af39d7a3bd26af22b5dc77c29ffb52ded5569e0a58695" => :high_sierra
    root_url 'https://github.com/claytono/homebrew-extras/releases/download/borgmatic-1.1.15'
  end

  resource "docopt" do
    url "https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz"
    sha256 "49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491"
  end

  resource "pykwalify" do
    url "https://files.pythonhosted.org/packages/c9/43/84d3b52161d27f7168c5870c79b97255f9d01c4b259bf32ca42dd39c21f0/pykwalify-1.6.1.tar.gz"
    sha256 "191fd3f457f23c0aa8538c3a5c0249f70eeb1046e88d0eaaef928e09c44dff8d"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/c5/39/4da7c2dbc4f023fba5fb2325febcadf0d0ce0efdc8bd12083a0f65d20653/python-dateutil-2.7.2.tar.gz"
    sha256 "9d8074be4c993fbe4947878ce593052f71dac82932a677d49194d8ce9778002e"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/10/aa/f31c8a858e23fe5b14c59e6a03ae80b4cb76353c184df48a582a55eb2674/ruamel.yaml-0.15.0.tar.gz"
    sha256 "f9f4a50422acf4a6ab55b568ae879b3ceb62e8e62a60022cb88816c17e40782e"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"generate-borgmatic-config", "-d", "test.config"
    assert_predicate testpath/"test.config", :exist?

    msg = shell_output("#{bin}/borgmatic --help")
    assert_match "usage: borgmatic", msg
  end
end
