{
  description = ''Create SVG-files with QR-codes from strings.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-qr-v1_3_0.flake = false;
  inputs.src-qr-v1_3_0.owner = "ThomasTJdev";
  inputs.src-qr-v1_3_0.ref   = "refs/tags/v1.3.0";
  inputs.src-qr-v1_3_0.repo  = "nim_qr";
  inputs.src-qr-v1_3_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-qr-v1_3_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-qr-v1_3_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}