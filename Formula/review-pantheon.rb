class ReviewPantheon < Formula
  include Language::Python::Virtualenv

  desc "Fail-closed AI review gate: hunter/verifier twins plus philosopher counsel"
  homepage "https://github.com/G-Schumacher44/review-pantheon"
  url "https://files.pythonhosted.org/packages/bb/54/f51f735e85aee72c453f6650ce6828102f1f0831fa5fd7b4b61ab4193ddb/review_pantheon-0.1.0.tar.gz"
  sha256 "d4644f98bd51321a33c236bf5985b0946f46e3c611de466f3092a96566d7d721"
  license "MIT"

  depends_on "python@3.13"

  def install
    # Stdlib-only package — no resources to vendor; the virtualenv is just isolation.
    virtualenv_install_with_resources
  end

  test do
    # No provider CLI in the test sandbox, so exercise the entry points' own surfaces.
    assert_match "pantheon", shell_output("#{bin}/pantheon --help")
    assert_match "0.1.0", shell_output("#{libexec}/bin/python -c 'import pantheon; print(pantheon.__version__)'")
  end
end
