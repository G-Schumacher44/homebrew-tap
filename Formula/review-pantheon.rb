class ReviewPantheon < Formula
  include Language::Python::Virtualenv

  desc "Fail-closed AI review gate: hunter/verifier twins plus philosopher counsel"
  homepage "https://github.com/G-Schumacher44/review-pantheon"
  url "https://files.pythonhosted.org/packages/8b/4a/122add189f3a8c3e51e53cd1fd9a5246b82b8a8db94a7575bcf6f9a5d3fa/review_pantheon-0.2.3.tar.gz"
  sha256 "44c80f09eeb63f8d3947c055bd53bdd0214f48c70739636d089b71b4f92d0557"
  license "MIT"

  depends_on "python@3.13"

  def install
    # Stdlib-only package — no resources to vendor; the virtualenv is just isolation.
    virtualenv_install_with_resources
  end

  test do
    # No provider CLI in the test sandbox, so exercise the entry points' own surfaces.
    assert_match "pantheon", shell_output("#{bin}/pantheon --help")
    assert_match "0.2.3", shell_output("#{libexec}/bin/python -c 'import pantheon; print(pantheon.__version__)'")
  end
end
