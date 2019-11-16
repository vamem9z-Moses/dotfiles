echo "Bootstrap the joker tool for clojure development - more info here https://github.com/candid82/joker"

go get -d github.com/candid82/joker
cd $GOPATH/src/github.com/candid82/joker
./run.sh --version && go install

echo "Bootstrap node-cljfmt"
npm install -g node-cljfmt

echo "Bootstrap clj-kondo"
npm install -g clj-kondo
