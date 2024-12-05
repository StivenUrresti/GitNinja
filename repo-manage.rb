class RepoManage < Formula
  desc "Git Automation Script"
  homepage "https://github.com/StivenUrresti/homebrew-repo-manage"
  url "https://github.com/StivenUrresti/homebrew-repo-manage/releases/download/v1.0.0/repo-manage"
  sha256 "242239525bfda31fee585d6e9722d34b051dfc1293eda7f12b0908fdf6338190"

  def install
    bin.install "repo-manage"
  end

  test do
    system "#{bin}/repo-manage", "--help"
  end
end
