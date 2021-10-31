with import <nixpkgs> {}; 

mkShell {
  nativeBuildInputs = [ 
    buildPackages.emacs
    buildPackages.git
    buildPackages.hugo
  ];
}
