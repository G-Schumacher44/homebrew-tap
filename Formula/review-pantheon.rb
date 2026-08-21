class ReviewPantheon < Formula
  include Language::Python::Virtualenv

  desc "Fail-closed AI review gate: hunter/verifier twins plus philosopher counsel"
  homepage "https://github.com/G-Schumacher44/review-pantheon"
  url "https://files.pythonhosted.org/packages/56/78/3721158fe3110e3285332692242ce1dcf05cf73b36eedb6a918cf429b4f7/review_pantheon-0.3.0.tar.gz"
  sha256 "6c9027b178fbef65cad387abcf71951c7e6ff0fcb77c0d008e57b91ce753f843"
  license "MIT"

  depends_on "python@3.13"

  def install
    # Stdlib-only package — no resources to vendor; the virtualenv is just isolation.
    virtualenv_install_with_resources
  end

  test do
    # No provider CLI in the test sandbox, so exercise the entry points' own surfaces.
    assert_match "pantheon", shell_output("#{bin}/pantheon --help")
    assert_match "0.3.0", shell_output("#{libexec}/bin/python -c 'import pantheon; print(pantheon.__version__)'")
  end
end
