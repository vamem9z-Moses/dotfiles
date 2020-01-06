echo "Bootstrap the joker tool for clojure development - more info here https://github.com/candid82/joker"

go get -d github.com/candid82/joker
cd $GOPATH/src/github.com/candid82/joker
./run.sh --version && go install

echo "Bootstrap node-cljfmt"
sudo npm install -g node-cljfmt

echo "Bootstrap clj-kondo"
cd $HOME/bin
wget https://raw.githubusercontent.com/borkdude/clj-kondo/master/script/install-clj-kondo 
bash install-clj-kondo --dir $HOME/bin
rm install-clj-kondo
