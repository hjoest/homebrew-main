require 'formula'

class Gcloud < Formula
  homepage 'https://cloud.google.com/sdk'
  url 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-98.0.0-linux-x86_64.tar.gz'
  version '98.0.0'
  sha1 'd6bb0cf253d68d2fafdff079ab9e7f1343a0a833'

  depends_on :python

  def install
    system './install.sh --disable-installation-options --usage-reporting false --path-update false --bash-completion false < /dev/null'
    prefix.install Dir['bin']
    prefix.install Dir['help']
    prefix.install Dir['lib']
    prefix.install Dir['platform']
    prefix.install Dir['.install']
    prefix.install 'properties'
  end

  test do
    system "#{bin}/gcloud", "version"
  end

end