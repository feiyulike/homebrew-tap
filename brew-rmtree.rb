class BrewRmtree < Formula
    homepage "https://github.com/feiyulike/homebrew-tap"
    url "https://github.com/feiyulike/homebrew-tap.git", :tag => "2.2.6"
    revision 1
  
    head "https://github.com/feiyulike/homebrew-tap.git"

    def install
      bin.install "cmd/brew-rmtree.rb"
    end
    
    def caveats
        <<~EOS
          You can uninstall this formula, as `brew tap beeftornado/brew-rmtree` is all that's
          needed to install Rmtree and keep it up to date.
        EOS
      end
  
    test do
      system "brew", "rmtree", "--help"
    end
end
