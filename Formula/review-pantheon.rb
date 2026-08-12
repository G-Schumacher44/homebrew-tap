class ReviewPantheon < Formula
  include Language::Python::Virtualenv

  desc "Fail-closed AI review gate: hunter/verifier twins plus philosopher counsel"
  homepage "https://github.com/G-Schumacher44/review-pantheon"
  url "https://files.pythonhosted.org/packages/bd/26/db206bbd32d5ed1cd3af9459cf906eeb24ce3f09485372fb23e920eef8ed/review_pantheon-0.2.1.tar.gz"
  sha256 "34f7b0177963a1f9e3904e7e4da6f8c069e38f6ea52679e6d2c9dbe3c452b776"
  license "MIT"

  depends_on "python@3.13"

  def install
    # Stdlib-only package — no resources to vendor; the virtualenv is just isolation.
    virtualenv_install_with_resources
  end

  test do
    # No provider CLI in the test sandbox, so exercise the entry points' own surfaces.
    assert_match "pantheon", shell_output("#{bin}/pantheon --help")
    assert_match "0.2.1", shell_output("#{libexec}/bin/python -c 'import pantheon; print(pantheon.__version__)'")
  end
end
