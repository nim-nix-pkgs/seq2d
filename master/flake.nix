{
  description = ''A 2D Sequence Implementation'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-seq2d-master.flake = false;
  inputs.src-seq2d-master.ref   = "refs/heads/master";
  inputs.src-seq2d-master.owner = "avahe-kellenberger";
  inputs.src-seq2d-master.repo  = "seq2d";
  inputs.src-seq2d-master.type  = "github";
  
  inputs."nimtest".owner = "nim-nix-pkgs";
  inputs."nimtest".ref   = "master";
  inputs."nimtest".repo  = "nimtest";
  inputs."nimtest".dir   = "v0_1_2";
  inputs."nimtest".type  = "github";
  inputs."nimtest".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimtest".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-seq2d-master"];
    over = if builtins.pathExists ./override.nix 
           then { override = import ./override.nix; }
           else { };
  in lib.mkRefOutput (over // {
    inherit self nixpkgs ;
    src  = deps."src-seq2d-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  } );
}