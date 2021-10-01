class Gradle2 < Formula
  desc "Build system based on the Groovy language"
  homepage "https://www.gradle.org/"
  url "https://services.gradle.org/distributions/gradle-2.0-bin.zip"
  sha256 "a1eb880c8755333c4d33c4351b269bebe517002532d3142c0b6164c9e8c081c3"

  bottle :unneeded

  depends_on :java => "1.8+"

  option "with-all", "Installs Javadoc, examples, and source in addition to the binaries"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    libexec.install %w[docs media samples src] if build.with? "all"
    (bin/"gradle").write_env_script libexec/"bin/gradle", Language::Java.overridable_java_home_env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gradle --version")
  end
end
