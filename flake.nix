{
  description = ''A 2D Sequence Implementation'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."seq2d-master".dir   = "master";
  inputs."seq2d-master".owner = "nim-nix-pkgs";
  inputs."seq2d-master".ref   = "master";
  inputs."seq2d-master".repo  = "seq2d";
  inputs."seq2d-master".type  = "github";
  inputs."seq2d-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."seq2d-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."seq2d-v0_1_0".dir   = "v0_1_0";
  inputs."seq2d-v0_1_0".owner = "nim-nix-pkgs";
  inputs."seq2d-v0_1_0".ref   = "master";
  inputs."seq2d-v0_1_0".repo  = "seq2d";
  inputs."seq2d-v0_1_0".type  = "github";
  inputs."seq2d-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."seq2d-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."seq2d-v0_1_1".dir   = "v0_1_1";
  inputs."seq2d-v0_1_1".owner = "nim-nix-pkgs";
  inputs."seq2d-v0_1_1".ref   = "master";
  inputs."seq2d-v0_1_1".repo  = "seq2d";
  inputs."seq2d-v0_1_1".type  = "github";
  inputs."seq2d-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."seq2d-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}