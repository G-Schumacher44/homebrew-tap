class ReviewPantheon < Formula
  include Language::Python::Virtualenv

  desc "Fail-closed AI review gate: hunter/verifier twins plus philosopher counsel"
  homepage "https://github.com/G-Schumacher44/review-pantheon"
  url "https://files.pythonhosted.org/packages/b8/8b/1c794cf00892262b2ab6ade7e66f5f4fd567c4048b88d1555fb9cdf0dfc0/review_pantheon-0.2.2.tar.gz"
  sha256 "2708c696c48ba0410e63f92286c5dbf5f5acbb320d4912075af608d88a7e84ba"
  license "MIT"

  depends_on "python@3.13"

  def install
    # Stdlib-only package — no resources to vendor; the virtualenv is just isolation.
    virtualenv_install_with_resources
  end

  test do
    # No provider CLI in the test sandbox, so exercise the entry points' own surfaces.
    assert_match "pantheon", shell_output("#{bin}/pantheon --help")
    assert_match "0.2.2", shell_output("#{libexec}/bin/python -c 'import pantheon; print(pantheon.__version__)'")
  end
end
